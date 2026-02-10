class BookingValidators {
  static String? requiredField(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? phone(String? v) {
    if (v == null || v.length < 11 || v.length > 11 ) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? seats(String? v) {
    final n = int.tryParse(v ?? '');
    if (n == null || n <= 0) {
      return 'Invalid number of seats';
    }
    return null;
  }

  static String? cardNumber(String? v) {
    final value = v?.replaceAll(' ', '') ?? '';
    if (value.length != 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  static String? expiry(String? v) {
    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(v ?? '')) {
      return 'Invalid expiry date';
    }
    return null;
  }

  static String? cvv(String? v) {
    if (!RegExp(r'^\d{3}$').hasMatch(v ?? '')) {
      return 'CVV must be 3 digits';
    }
    return null;
  }
}
