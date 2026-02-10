import 'package:app1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/enums.dart';
import '../../view_model/booking_cubit.dart';


class PaymentTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final PaymentMethod value;

  const PaymentTile({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();
    final state = context.watch<BookingCubit>().state;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.surface,
      child: RadioListTile<PaymentMethod>(
        value: value,
        groupValue: state.paymentMethod,
        onChanged: (v) => cubit.changePaymentMethod(v!),
        title: Text(title),
        secondary: Icon(icon),
      ),
    );
  }
}
