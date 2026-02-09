import 'package:app1/features/user/presentation/view/view_model/user_trips_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../admin/trips/data/models/trip_model.dart';

class UserTripsCubit extends Cubit<UserTripsStates> {
  UserTripsCubit(): super(InitUserTrips());

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
}