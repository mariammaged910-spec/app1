import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/ repositories/trip_repository.dart';
import '../../data/models/trip_model.dart';
import 'trip_admin_state.dart';

class TripAdminCubit extends Cubit<TripAdminState> {
  final TripRepository repository;

  TripAdminCubit(this.repository) : super(TripAdminInitial());

  void listenToTrips() {
    emit(TripAdminLoading());

    repository.getTrips().listen((trips) {
      emit(TripAdminLoaded(trips));
    });
  }

  Future<void> addTrip(TripModel trip) async {
    await repository.addTrip(trip);
  }

  Future<void> deleteTrip(String id) async {
    await repository.deleteTrip(id);
  }

  Future<void> updateTrip(TripModel trip) async {
    await repository.updateTrip(trip);
  }
}
