import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;

    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
      ),
      toolbarHeight: 0.4 * height,
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
                Text("Discover Egypt", style: AppTextStyles.h1Display.copyWith(color: AppColors.surface,),),
                Text("Plan your next adventure", style: AppTextStyles.smallRegular.copyWith(color: AppColors.surface,),)
              ],
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.person_outline, color: AppColors.surface, )
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
