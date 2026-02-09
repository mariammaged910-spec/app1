import 'package:flutter/material.dart';
import 'features/admin/trips/presentation/view/pages/add_trip_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Admin',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const AddTripScreen(),
    );
  }
}


