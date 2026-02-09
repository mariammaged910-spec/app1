import 'package:flutter/material.dart';
import '../../../data/home_card_model.dart';
import '../widgets/trip_content.dart';
import '../widgets/trip_header.dart';

class TripDetails extends StatelessWidget {
  static const String routeName = "tripDetails";
  final HomeCardModel homeCard;
  const TripDetails({super.key, required this.homeCard});

  @override
  Widget build(BuildContext context) {
    final HomeCardModel card = homeCard ?? ModalRoute.of(context)!.settings.arguments as HomeCardModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripHeader(image: card.tripImage),
            TripContent(card),
          ],
        ),
      ),
    );
  }
}
