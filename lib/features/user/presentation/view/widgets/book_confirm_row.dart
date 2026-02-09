import 'package:app1/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class BookConfirmRow extends StatelessWidget {
  final String title;
  final String text;
  final bool isMoney;

  const BookConfirmRow({required this.title, required this.text,this.isMoney = false, super.key});

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 0.9 * width,
              child: Text(title, style: AppTextStyles.caption)),
          SizedBox(
            width: 0.9 * width,
            child: Text(text, style: isMoney ? AppTextStyles.bodyMedium : AppTextStyles.caption,
            ),
          ),
        ],
      );
  }
}
