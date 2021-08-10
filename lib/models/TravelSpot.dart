import 'package:flutter/material.dart';
import 'package:nowrth/models/Guide.dart';

class TravelSpot {
  final String name, image;
  final DateTime date;
  final List<Guide> guides;

  TravelSpot({
    @required this.guides,
    @required this.name,
    @required this.image,
    @required this.date,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    guides: guides..shuffle(),
    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
  TravelSpot(
    guides: guides..shuffle(),
    name: "Magical World",
    image: "assets/images/Magical_World.png",
    date: DateTime(2020, 3, 10),
  ),
  TravelSpot(
    guides: guides..shuffle(),
    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
];

List<Guide> guides = [guide1, guide2, guide3, guide4, guide5];
