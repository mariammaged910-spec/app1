import 'package:flutter/material.dart';

import 'booking_confirmed.dart';

class BookPage extends StatelessWidget {
  static const String routeName = "BookName";
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: IconButton(onPressed:(){
        Navigator.pushNamed(context, BookingConfirmed.routeName);
      } , icon: Icon(Icons.add)),
    );
  }
}

