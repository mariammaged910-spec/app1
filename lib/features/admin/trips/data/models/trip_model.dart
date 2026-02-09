import 'package:intl/intl.dart';

enum TripStatus { confirmed, pending, cancelled }

class TripModel {
  final String id;
  final String destination;
  final String origin;
  final DateTime startDate;
  final String paymentMethod;
  final int price;
  final int totalSeats;
  final int availableSeats;
  final String description;
  final TripStatus status;
  final DateTime? bookedAt;
  final String createdBy;

  TripModel({
    required this.id,
    required this.destination,
    required this.price,
    required this.totalSeats,
    required this.availableSeats,
    required this.description,
    required this.createdBy,
    required this.origin,
    required this.startDate,
    required this.paymentMethod,
    required this.status,
    this.bookedAt,
  });

  String get formattedDate => DateFormat('MMM d, yyyy • hh:mm a').format(startDate);
  String get formattedBookedDate => DateFormat('MMM d, yyyy').format(bookedAt!);


  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "destination": destination,
      "price": price,
      "totalSeats": totalSeats,
      "availableSeats": availableSeats,
      "description": description,
      "createdBy": createdBy,
      "origin": origin,
      "startDate": startDate,
      "paymentMethod": paymentMethod,
      "status": status,
      "bookedAt": bookedAt,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      id: map["id"],
      destination: map["destination"],
      price: map["price"],
      totalSeats: map["totalSeats"],
      availableSeats: map["availableSeats"],
      description: map["description"],
      createdBy: map["createdBy"],
      origin: map["origin"],
      startDate: map["startDate"],
      paymentMethod: map["paymentMethod"],
      status: map["status"],
    );
  }
}
