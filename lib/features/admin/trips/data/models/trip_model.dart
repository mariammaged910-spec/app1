class TripModel {
  final String id;
  final String destination;

  final DateTime dateTime;
  final int price;
  final int totalSeats;
  final int availableSeats;
  final String description;
  final String createdBy;

  TripModel({
    required this.id,
    required this.destination,

    required this.dateTime,
    required this.price,
    required this.totalSeats,
    required this.availableSeats,
    required this.description,
    required this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "destination": destination,

      "dateTime": dateTime.toIso8601String(),
      "price": price,
      "totalSeats": totalSeats,
      "availableSeats": availableSeats,
      "description": description,
      "createdBy": createdBy,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      id: map["id"],
      destination: map["destination"],
      dateTime: DateTime.parse(map["dateTime"]),
      price: map["price"],
      totalSeats: map["totalSeats"],
      availableSeats: map["availableSeats"],
      description: map["description"],
      createdBy: map["createdBy"],
    );
  }
}
