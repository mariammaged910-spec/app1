import '../models/trip_model.dart';
import 'trip_repository.dart';
//دا فيك علشان اجرب منه بس
class MockTripRepository implements TripRepository {

  final List<TripModel> _trips = [];

  @override
  Future<void> addTrip(TripModel trip) async {
    _trips.add(trip);
  }

  @override
  Future<void> deleteTrip(String tripId) async {
    _trips.removeWhere((trip) => trip.id == tripId);
  }

  @override
  Stream<List<TripModel>> getTrips() async* {
    yield _trips;
  }

  @override
  Future<void> updateTrip(TripModel trip) async {}
}
