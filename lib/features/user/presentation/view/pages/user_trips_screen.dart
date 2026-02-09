import 'package:app1/core/widgets/gradient_button.dart';
import 'package:app1/features/user/presentation/view/view_model/user_trips_cubit.dart';
import 'package:app1/features/user/presentation/view/view_model/user_trips_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/trip_card.dart';

class UserTripsScreen extends StatelessWidget {
  const UserTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserTripsCubit, UserTripsStates>(
        builder: (context, state) {
          return ListView(
            children: [
              GradientButton(text: 'My Trips', onPressed: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text(
                  '${context.read<UserTripsCubit>().trips.length} trips',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
              ),
              ...context.read<UserTripsCubit>().trips.map((trip) => TripCard(trip: trip, onEdit: () {  }, onDelete: () {  },)),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}

