
import 'package:app1/features/admin/trips/data/models/trip_model.dart';

import 'customer_model.dart';

class Booking {
  final String id;
  final TripModel trip;
  final Customer customer;

  Booking({
    required this.id,
    required this.trip,
    required this.customer,
  });
}