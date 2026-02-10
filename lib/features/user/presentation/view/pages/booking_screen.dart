import 'package:app1/core/utils/text_style.dart';
import 'package:app1/features/user/presentation/view/pages/booking_confirmed.dart';
import 'package:app1/features/user/presentation/view/pages/home_page.dart';
import 'package:app1/features/user/presentation/view/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/enums.dart';
import '../../view_model/booking_cubit.dart';
import '../widgets/credit_card_fields.dart';
import '../widgets/payment_title.dart';


class BookingScreen extends StatefulWidget {
  static const String routeName = "BookingScreen";
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  // Passenger
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _seatsController = TextEditingController();

  // Credit card
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();


  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _seatsController.dispose();
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _confirmBooking() {
    final paymentMethod = context.read<BookingCubit>().state.paymentMethod;

    if (!_formKey.currentState!.validate()) return;

    if (paymentMethod == PaymentMethod.creditCard) {
      if (_cardNumberController.text.isEmpty ||
          _cardNameController.text.isEmpty ||
          _expiryController.text.isEmpty ||
          _cvvController.text.isEmpty) {
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking confirmed successfully')),
    );

    Navigator.pushNamed(context, BookingConfirmed.routeName);
  }



  static const int seatPrice = 200;

  int get totalAmount {
    final seats = int.tryParse(_seatsController.text) ?? 0;
    return seats * seatPrice;
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = context.watch<BookingCubit>().state.paymentMethod;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.2 * height),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
            child: AppBarWidget(
              text: "Book ur trip Now!", icon: Icons.home_outlined,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Passenger Details', style: AppTextStyles.h3Subheading,),
              SizedBox(height: 0.01 * height,),
              textFieldInput(_fullNameController, 'Full Name'),
              SizedBox(height: 0.01 * height,),
              textFieldInput(_phoneController, 'Phone Number',
                  keyboard: TextInputType.phone),
              SizedBox(height: 0.01 * height,),
              textFieldInput(_seatsController, 'Number of Seats',
                  keyboard: TextInputType.number),
              SizedBox(height: 0.01 * height,),
              Text('Payment Method', style: AppTextStyles.h3Subheading,),
              SizedBox(height: 0.01 * height,),

              PaymentTile(
                title: 'Cash on Arrival',
                icon: Icons.payments_outlined,
                value: PaymentMethod.cash,
              ),
              SizedBox(height: 0.01 * height,),
              PaymentTile(
                title: 'Credit Card',
                icon: Icons.credit_card,
                value: PaymentMethod.creditCard,
              ),
              SizedBox(height: 0.01 * height,),
              if (paymentMethod == PaymentMethod.creditCard)
                CreditCardFields(
                  cardNumber: _cardNumberController,
                  name: _cardNameController,
                  expiry: _expiryController,
                  cvv: _cvvController,
                ),
              SizedBox(height: 0.02 * height,),
              _totalMoney(),
              SizedBox(height: 0.02 * height,),
              ElevatedButton(
                onPressed: _confirmBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                    'Confirm Booking',
                    style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget textFieldInput(TextEditingController controller,
      String label, {
        TextInputType keyboard = TextInputType.text,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      validator: (v) {
        if (v == null || v
            .trim()
            .isEmpty) return 'Required field';
        if (label == 'Phone Number' && v.length < 11) {
          return 'Invalid phone number';
        }
        if (label == 'Number of Seats') {
          final n = int.tryParse(v);
          if (n == null || n <= 0) return 'Invalid seats number';
        }
        return null;
      },
    );
  }

  Widget _totalMoney() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Amount', style: AppTextStyles.h3Subheading),
          Text(
            '$totalAmount EGP',
            style: AppTextStyles.h3Subheading,
          ),
        ],
      ),
    );
  }
}



