import 'package:flutter/material.dart';

class StopBySpot {
  final String name;
  final String stopType;
  final IconData iconData;
  final double rating;
  final bool isTravelSpot;

  StopBySpot({
    required this.name,
    required this.iconData,
    required this.stopType,
    required this.rating,
    this.isTravelSpot = false,
  });
}

Map<String, String> spotTypes = {
  "hotel": "Hotel",
  "restaurant": "Restaurant",
  "travelSpot": "Travel Spot",
  "fuelStation": "Fuel Station",
  "bank": "Bank",
};

// List<StopBySpot> stopBySpots = [stopBySpot0, stopBySpot1, stopBySpot2];

StopBySpot stopBySpot0 = StopBySpot(
  name: "Swat Hotel",
  stopType: spotTypes["hotel"] ?? "Unknown",
  iconData: Icons.fastfood,
  rating: 2,
  isTravelSpot: false,
);

StopBySpot stopBySpot1 = StopBySpot(
  name: "Naran Restraunt",
  stopType: spotTypes["restaurant"] ?? "Unknown",
  iconData: Icons.hotel,
  rating: 4,
  isTravelSpot: false,
);

StopBySpot stopBySpot2 = StopBySpot(
  name: "Babusar Top",
  stopType: spotTypes["travelSpot"] ?? "Unknown",
  iconData: Icons.landscape,
  rating: 4.5,
  isTravelSpot: false,
);
