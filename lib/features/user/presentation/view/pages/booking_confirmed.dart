import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../widgets/booking_confirmed_container.dart';
import 'home_page.dart';

class BookingConfirmed extends StatelessWidget {
  static const String routeName = "BookingConfirmed";
  const BookingConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/confirmed.png",
                width: 0.6*width,
                height: 0.25*height,
                color: AppColors.primaryGradient.colors.first,
              ),

              SizedBox(height: 0.02 * height,),
              Text(
                'Booking Confirmed!',
                style: AppTextStyles.h2Heading,
              ),
             Center(
               child: Text(
                  'Your trip has been successfully booked.',
                 style: AppTextStyles.bodyMedium,
                ),
             ),

              SizedBox(height: 0.02 * height,),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: BookingConfirmedContainer()
                ),
              ),

              SizedBox(height: 0.04 * height,),

              GradientButton(text: "Back to Home", onPressed: (){
                Navigator.pushNamed(context, HomePage.routeName);
              },),
            ],
          ),
        ),
      ),
    );
  }
}