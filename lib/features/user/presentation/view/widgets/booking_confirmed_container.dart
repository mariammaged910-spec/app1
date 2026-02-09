import 'package:flutter/material.dart';

import 'book_confirm_row.dart';

class BookingConfirmedContainer extends StatelessWidget {
  const BookingConfirmedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookConfirmRow(title:'Destination',text: 'Sharm El Sheikh'),
        SizedBox(height: 0.01 * height,),
        const Divider(
          height: 16,
          thickness: 0.5,
          color: Colors.grey,
        ),
        BookConfirmRow(title: 'Date & Time', text: 'Feb 18, 2026 • 07:30 AM',),
        SizedBox(height: 0.01 * height,),
        const Divider(
          height: 16,
          thickness: 0.5,
          color: Colors.grey,
        ),
        SizedBox(height: 0.01 * height,),
        BookConfirmRow(title: 'Passenger Name', text: 'Mohamed'),
        const Divider(
          height: 16,
          thickness: 0.5,
          color: Colors.grey,
        ),
        SizedBox(height: 0.01 * height,),
        BookConfirmRow(title: 'Total Paid',text:  '650 EGP', isMoney: true),
      ],
    );
  }
}
