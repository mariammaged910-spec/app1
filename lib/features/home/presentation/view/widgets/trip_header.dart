import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class TripHeader extends StatelessWidget {
  final String image;
  const TripHeader({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(image,
          width: double.infinity,
          height: 0.35 * height,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20),
          child: CircleAvatar(
            backgroundColor: AppColors.surface,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
