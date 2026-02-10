import '../../../../core/widgets/enums.dart';

class BookingState {
  final PaymentMethod paymentMethod;

  const BookingState({
    required this.paymentMethod,
  });

  BookingState copyWith({
    PaymentMethod? paymentMethod,
  }) {
    return BookingState(
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
