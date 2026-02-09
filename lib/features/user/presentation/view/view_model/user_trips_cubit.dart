import 'package:app1/features/user/presentation/view/view_model/user_trips_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTripsCubit extends Cubit<UserTripsStates> {
  UserTripsCubit(): super(InitUserTrips());


}