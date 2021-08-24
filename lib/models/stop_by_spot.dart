import 'package:flutter/material.dart';

class StopBySpot {
  final String stopType;
  final String areaName;
  final IconData iconData;
  final double rating;
  final bool isTravelSpot;

  StopBySpot({
    required this.stopType,
    required this.areaName,
    required this.iconData,
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
  stopType: spotTypes["hotel"] ?? "Unknown",
  areaName: "Kaghan",
  iconData: Icons.hotel,
  rating: 2,
  isTravelSpot: false,
);

StopBySpot stopBySpot1 = StopBySpot(
  stopType: spotTypes["restaurant"] ?? "Unknown",
  areaName: "Naran",
  iconData: Icons.fastfood,
  rating: 4,
  isTravelSpot: false,
);

StopBySpot stopBySpot2 = StopBySpot(
  stopType: spotTypes["travelSpot"] ?? "Unknown",
  areaName: "Babusar Top",
  iconData: Icons.landscape,
  rating: 4.5,
  isTravelSpot: false,
);
