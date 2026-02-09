import 'package:flutter/material.dart';
import 'package:app1/core/utils/app_colors.dart';
import '../../features/admin/trips/data/models/trip_model.dart';
import '../utils/text_style.dart';

class TripCard extends StatelessWidget {
  final TripModel trip;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TripCard({
    super.key,
    required this.trip,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trip.destination, style: AppTextStyles.h3Subheading),

              Row(
                children: [
                  _circleIcon(Icons.edit, AppColors.pastelMint, onEdit),
                  const SizedBox(width: 8),
                  _circleIcon(Icons.delete, AppColors.pastelPink, onDelete),
                ],
              )
            ],
          ),

          const SizedBox(height: 8),

          Text("${trip.bookedAt}",
              style: AppTextStyles.smallRegular),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Available Seats",
                        style: AppTextStyles.smallRegular),
                    Text("${trip.availableSeats}",
                        style: AppTextStyles.bodyMedium),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Price", style: AppTextStyles.smallRegular),
                    Text("${trip.price} EGP",
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: color.withOpacity(.2),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}
