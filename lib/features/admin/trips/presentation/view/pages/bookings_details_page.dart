import 'package:app1/core/widgets/gradient_button.dart';
import 'package:app1/features/admin/trips/presentation/view_model/trip_admin_cubit.dart';
import 'package:app1/features/admin/trips/presentation/view_model/trip_admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/booking_card.dart';

class BookingsDetailsPage extends StatelessWidget {
  const BookingsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TripAdminCubit, TripAdminState>(
        builder: (context, state) {
          return ListView(
            children: [
              GradientButton(text: 'Bookings', onPressed: () {Navigator.pop(context);}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text(
                  '${context.read<TripAdminCubit>().totalBookings} total bookings',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
              ),
              ...context.read<TripAdminCubit>().bookings.map((b) => BookingCard(booking: b)),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}