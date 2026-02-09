import 'package:flutter/material.dart';
import '../../../../../core/utils/text_style.dart';
import 'home_trip_card_row_widget.dart';

class TripDetailsContainerWidget extends StatelessWidget {
  final Color containerColor;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final String title;
  final String text;

  const TripDetailsContainerWidget({
    required this.containerColor,
    required this.icon,
    required this.iconSize,
    this.iconColor,
    required this.title,
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: 0.44 * width,
        height: 0.1 * height,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadiusGeometry.circular(24)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTripCardRowWidget(icon: icon, text: title, iconSize: iconSize, iconColor: iconColor,),
            SizedBox(height: 0.01 * height,),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(text, style: AppTextStyles.caption,),
            )
          ],
        )
    );
  }
}
