import 'package:app1/features/user/presentation/view/widgets/trip_details_container_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../data/home_card_model.dart';
import '../pages/book_page.dart';
import 'home_trip_card_row_widget.dart';

class TripContent extends StatelessWidget {
  final HomeCardModel homeCard;
  const TripContent(this.homeCard, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.02 * height),
          Text(homeCard.tripName, style: AppTextStyles.h2Heading),
          SizedBox(height: 0.01 * height),
          HomeTripCardRowWidget(
            icon: Icons.location_on_outlined,
            text: homeCard.location,
            iconSize: 22,
          ),
          SizedBox(height: 0.01 * height),
          Row(
            children: [
              TripDetailsContainerWidget(containerColor: AppColors.babyBlue, icon: Icons.calendar_today_outlined,iconSize:  16 ,title:  "Date" ,text: homeCard.date),
              SizedBox(width: 0.02 * width),
              TripDetailsContainerWidget(containerColor: AppColors.babyMint, icon: Icons.access_time,iconSize:  16 , iconColor: AppColors.pastelMint, title: "Time" ,text:homeCard.time),
            ],
          ),
          SizedBox(height: 0.01 * height,),
          Row(
            children: [
              TripDetailsContainerWidget(containerColor: AppColors.babyPeach, icon: Icons.money_off_outlined,iconSize:  16 ,iconColor: AppColors.pastelPeach,title: "Price" ,text:homeCard.money),
              SizedBox(width: 0.02 * width),
              TripDetailsContainerWidget(containerColor: AppColors.babyLavender, icon: Icons.person_outline,iconSize:  18 , iconColor: AppColors.pasteLavender, title: "Available Seats"  ,text:"100 Seat"),
            ],
          ),
          SizedBox(height: 0.02 * height),
          Text("About This Trip", style: AppTextStyles.h2Heading),
          SizedBox(height: 0.01 * height),
          Text(
            "Explore the beautiful Mediterranean coast of Alexandria. Visit the Bibliotheca Alexandrina, Qaitbay Citadel, and enjoy fresh seafood by the sea.",
            style: AppTextStyles.caption,
          ),
          SizedBox(height: 0.02 * height),
          Text("About Company", style: AppTextStyles.h2Heading),
          SizedBox(height: 0.01 * height),
          Text("Company Description", style: AppTextStyles.caption),
          SizedBox(height: 0.03 * height),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primaryGradient.colors.first),
              ),
              onPressed: (){
                Navigator.pushNamed(context, BookPage.routeName);
              },
              child: Text("Book This Trip", style: AppTextStyles.smallRegular.copyWith(color: AppColors.surface)),
            ),
          )
        ],
      ),
    );
  }
}

