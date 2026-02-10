import 'package:app1/core/widgets/gradient_button.dart';
import 'package:app1/features/admin/trips/presentation/view_model/trip_admin_cubit.dart';
import 'package:app1/features/admin/trips/presentation/view_model/trip_admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/quick_action_tile.dart';
import '../widgets/state_card.dart';
import 'bookings_details_page.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TripAdminCubit, TripAdminState>(
        builder: (context, state) {
          return ListView(
            children: [
              GradientButton(text: 'Admin', onPressed: () {}),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatCard(
                      title: 'Total Trips',
                      value: '${context.read<TripAdminCubit>().totalTrips}',
                      gradientStart: Colors.teal.shade200,
                      gradientEnd: Colors.cyan.shade200,
                    ),
                    StatCard(
                      title: 'Bookings',
                      value: "${context
                          .read<TripAdminCubit>()
                          .totalBookings}",
                      gradientStart: Colors.purple.shade200,
                      gradientEnd: Colors.pink.shade200,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Revenue card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.pink],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Revenue',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${context.read<TripAdminCubit>().totalRevenue} EGP',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Actions',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    QuickActionTile(
                      icon: Icons.add,
                      title: 'Add New Trip',
                      subtitle: 'Create a new travel package',
                      onTap: () {},
                    ),
                    QuickActionTile(
                      icon: Icons.edit,
                      title: 'Manage Trips',
                      subtitle: 'Edit or delete existing trips',
                      onTap: () {},
                    ),
                    QuickActionTile(
                      icon: Icons.people,
                      title: 'View Bookings',
                      subtitle: 'See all customer bookings',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => BookingsDetailsPage(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}