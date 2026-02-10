import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../data/home_card_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/home_trip_card.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";
  HomeScreen({super.key});

  final List<HomeCardModel> tripData =[
    HomeCardModel("assets/images/alex.jpg", "Alexandria", " From Alex", " Jan, 13, 2026", " 6:00 AM", "200 EGP")
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.2 * height),
        child: AppBarWidget(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("Available Trips", style: AppTextStyles.h2Heading),
            ),
            TripCardHome(tripData[0]),
            TripCardHome(tripData[0]),

          ],
        ),
      ),
    );
  }
}
