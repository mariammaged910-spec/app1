import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/enums.dart';
import 'booking_state.dart';


class BookingCubit extends Cubit<BookingState> {
  BookingCubit()
      : super(
    const BookingState(
      paymentMethod: PaymentMethod.cash,
    ),
  );

  void changePaymentMethod(PaymentMethod method) {
    emit(
      state.copyWith(paymentMethod: method),
    );
  }
}

