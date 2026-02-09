import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../data/home_card_model.dart';
import '../pages/trip_details.dart';
import 'home_trip_card_row_widget.dart';

class TripCardHome extends StatelessWidget {
  final HomeCardModel homeCard;
  const TripCardHome(this.homeCard,{super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TripDetails.routeName, arguments: homeCard);
      },
      child: Card(
        elevation: 30,
        color: AppColors.surface,
        shadowColor:Color.fromRGBO(168, 216, 234, 0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ClipRRect(
                    borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(24), topLeft: Radius.circular(24)),
                    child: Image.asset(homeCard.tripImage, width: double.infinity, height: 0.25 * height, fit: BoxFit.cover,)),
              SizedBox(height: 0.02 * height,),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(homeCard.tripName, style: AppTextStyles.h3Subheading,),
              ),
              SizedBox(height: 0.01 * height,),
              HomeTripCardRowWidget(icon:Icons.location_on_outlined,text: homeCard.location,iconSize:  22,),
              SizedBox(height: 0.01 * height,),
              HomeTripCardRowWidget(icon:Icons.calendar_today_outlined,text: homeCard.date,iconSize:  15),
              SizedBox(height: 0.01 * height,),
              HomeTripCardRowWidget(icon:Icons.access_time,text: homeCard.time,iconSize:  16),
              SizedBox(height: 0.01 * height,),
              Row(
                children: [
                  HomeTripCardRowWidget(icon: Icons.attach_money_outlined, text: homeCard.money,iconSize:  25, isMoney: true,),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.primaryGradient.colors.first
                      ),
                    ),
                    onPressed: (){},
                    child: Text("Book Now", style: AppTextStyles.smallRegular.copyWith(color: AppColors.surface)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}