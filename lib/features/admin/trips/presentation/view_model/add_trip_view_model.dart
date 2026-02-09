import 'package:flutter/material.dart';

class AddTripViewModel extends ChangeNotifier {

  final formKey = GlobalKey<FormState>();

  /// controllers
  final destinationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final priceController = TextEditingController();
  final seatsController = TextEditingController();

  /// validation methods
  String? validateDestination(String? value) {
    if (value == null || value.isEmpty) {
      return "Destination is required";
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "Date is required";
    }
    return null;
  }

  String? validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Time is required";
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return "Price is required";
    }
    if (double.tryParse(value) == null) {
      return "Enter valid number";
    }
    return null;
  }

  String? validateSeats(String? value) {
    if (value == null || value.isEmpty) {
      return "Seats required";
    }
    if (int.tryParse(value) == null) {
      return "Enter valid number";
    }
    return null;
  }

  /// submit
  void submit() {
    if (formKey.currentState!.validate()) {
      /// call repository
      /// send data to backend
      print("Trip Added Successfully");
    }
  }

  @override
  void dispose() {
    destinationController.dispose();
    dateController.dispose();
    timeController.dispose();
    priceController.dispose();
    seatsController.dispose();
    super.dispose();
  }
}
