import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/ repositories/trip_repository.dart';
import '../../data/models/booking_model.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/trip_model.dart';
import 'trip_admin_state.dart';

class TripAdminCubit extends Cubit<TripAdminState> {
  final TripRepository repository;

  TripAdminCubit(this.repository) : super(TripAdminInitial());

  // trips from firebase
  final List<TripModel>  trips = [
      TripModel(
        id: '1',
        destination: 'Alexandria',
        origin: 'From Cairo',
        startDate: DateTime(2026, 2, 15, 8),
        paymentMethod: 'Credit Card',
        price: 400,
        status: TripStatus.confirmed,
        bookedAt: DateTime(2026, 2, 8),
        totalSeats: 50,
        availableSeats: 20,
        description: '',
        createdBy: '',
      ),
      TripModel(
        id: '2',
        destination: 'Luxor',
        origin: 'From Cairo',
        startDate: DateTime(2026, 2, 20, 6),
        paymentMethod: 'Vodafone Cash',
        price: 850,
        status: TripStatus.confirmed,
        bookedAt: DateTime(2026, 2, 7),
        totalSeats: 100,
        availableSeats: 30,
        description: '',
        createdBy: '',
      ),
      TripModel(
        id: '3',
        destination: 'Sharm El Sheikh',
        origin: 'From Cairo',
        startDate: DateTime(2026, 2, 18, 7, 30),
        paymentMethod: 'Credit Card',
        price: 650,
        status: TripStatus.confirmed,
        bookedAt: DateTime(2026, 2, 6),
        totalSeats: 80,
        availableSeats: 25,
        description: '',
        createdBy: '',
      ),
    ];
  late final int totalTrips = trips.length;
  late final totalRevenue = trips.fold(0, (sum, t) => sum + t.price);
  late final List<Booking> bookings = [
      Booking(
        id: 'b1',
        trip: trips[0],
        customer: Customer(
          name: 'Ahmed Hassan',
          email: 'ahmed@example.com',
          phone: '+20 123 456 7890',
          paymentMethod: 'Credit Card',
        ),
      ),
      Booking(
        id: 'b2',
        trip: trips[1],
        customer: Customer(
          name: 'Sara Mohamed',
          email: 'sara@example.com',
          phone: '+20 111 222 3333',
          paymentMethod: 'Vodafone Cash',
        ),
      ),
    ];
  late final int totalBookings = bookings.length;



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
