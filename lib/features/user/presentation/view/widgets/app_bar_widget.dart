import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  final String des;
  final IconData icon;
  const AppBarWidget({required this.text, required this.icon ,this.des="", super.key});

  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: AppColors.primary,
      toolbarHeight: 0.2* height,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: AppTextStyles.h1Display.copyWith(color: AppColors.surface,),),
                Text(des, style: AppTextStyles.smallRegular.copyWith(color: AppColors.surface,),)
              ],
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(icon, color: AppColors.surface, )
              ),)
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
              bottomRight: Radius.circular(28),
              bottomLeft: Radius.circular(28))
      ),
    );
  }
}
