import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';

class HomeTripCardRowWidget extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String text;
  final double iconSize;
  final bool isMoney;

  const HomeTripCardRowWidget({
    super.key,
    required this.icon,
    this.iconColor,
    required this.text,
    required this.iconSize,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 0.1 * width,
          child: Icon(icon, size: iconSize, color: AppColors.pastelBlue,),
        ),
        SizedBox(width: 0.0013 * width),
        Text(text, style: isMoney ? AppTextStyles.h3Subheading : AppTextStyles.smallRegular,
        ),
      ],
    );
  }
}

