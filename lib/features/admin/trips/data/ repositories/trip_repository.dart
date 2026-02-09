import '../models/trip_model.dart';

abstract class TripRepository {

  Future<void> addTrip(TripModel trip);

  Future<void> deleteTrip(String tripId);

  Future<void> updateTrip(TripModel trip);

  Stream<List<TripModel>> getTrips();
}
