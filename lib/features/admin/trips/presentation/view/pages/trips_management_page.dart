import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app1/core/utils/app_colors.dart';
import 'package:app1/core/widgets/trip_card.dart';
import '../../view_model/trip_admin_cubit.dart';
import '../../view_model/trip_admin_state.dart';

class TripsManagementPage extends StatelessWidget {
  const TripsManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<TripAdminCubit, TripAdminState>(
            builder: (context, state) {

              if (state is TripAdminLoaded) {
                return ListView.builder(
                  itemCount: state.trips.length,
                  itemBuilder: (context, index) {

                    final trip = state.trips[index];

                    return TripCard(
                      trip: trip,

                      onEdit: () {
                        context.read<TripAdminCubit>().updateTrip(trip);
                      },

                      onDelete: () {
                        context.read<TripAdminCubit>().deleteTrip(trip.id);
                      },
                    );
                  },
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
