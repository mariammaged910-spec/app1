

import '../../data/models/trip_model.dart';

abstract class TripAdminState {}

class TripAdminInitial extends TripAdminState {}

class TripAdminLoading extends TripAdminState {}

class TripAdminLoaded extends TripAdminState {
  final List<TripModel> trips;

  TripAdminLoaded(this.trips);
}
