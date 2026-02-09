import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class BookingConfirmed extends StatelessWidget {
  static const String routeName = "BookPage";
  const BookingConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/confirmed.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 32),

              const Text(
                'Booking Confirmed!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const Text(
                'Your trip has been successfully booked',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Destination', 'Sharm El Sheikh'),
                    const Divider(
                      height: 16,
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    _buildInfoRow(
                      'Date & Time',
                      'February 18, 2026 • 07:30 AM',
                    ),
                    const Divider(
                      height: 16,
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    _buildInfoRow('Passenger Name', 'اقع'),
                    const Divider(
                      height: 16,
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    _buildInfoRow('Total Paid', '650 EGP', boldValue: true),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Text(
                'A confirminin Layoutreesanb easeen trieme.\nmaioKilling lent dient.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool boldValue = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: boldValue ? FontWeight.bold : FontWeight.normal,
            color: boldValue ? Colors.black : Colors.grey[800],
          ),
        ),
      ],
    );
  }
}