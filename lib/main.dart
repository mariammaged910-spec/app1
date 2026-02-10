import 'package:flutter/material.dart';
import 'features/user/data/home_card_model.dart';
import 'features/user/presentation/view/pages/book_page.dart';
import 'features/user/presentation/view/pages/booking_confirmed.dart';
import 'features/user/presentation/view/pages/home_page.dart';
import 'features/user/presentation/view/pages/home_screen.dart';
import 'features/user/presentation/view/pages/trip_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        HomeScreen.routeName: (context) => HomeScreen(),
        TripDetails.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as HomeCardModel;
          return TripDetails(homeCard: args);
        },
        BookPage.routeName:(context) => BookPage(),
        BookingConfirmed.routeName:(context) => BookingConfirmed()
      },
    );
  }
}

