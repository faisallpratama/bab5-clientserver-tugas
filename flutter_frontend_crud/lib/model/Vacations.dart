// To parse this JSON data, do
//
//     final vacations = vacationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Vacations vacationsFromJson(String str) => Vacations.fromJson(json.decode(str));

String vacationsToJson(Vacations data) => json.encode(data.toJson());

class Vacations {
  Vacations({
    required this.data,
  });

  List<Vacation> data;

  factory Vacations.fromJson(Map<String, dynamic> json) => Vacations(
    data:
    List<Vacation>.from(json["data"].map((x) => Vacation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Vacation {
  Vacation({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.city,
    required this.price,
  });

  int id;
  String name;
  String description;
  String image;
  String city;
  int price;

  factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    city: json["city"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "city": city,
    "price": price,
  };
}
