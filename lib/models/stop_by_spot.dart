import 'package:flutter/material.dart';
import 'package:nowrth/models/spot.dart';

class StopBySpot {
  final SpotType stopType;
  final String areaName;
  final double rating;

  String? stopText;
  IconData? iconData;
  bool? isTravelSpot = false;

  StopBySpot({
    required this.stopType,
    required this.areaName,
    required this.rating,
  }) {
    switch (this.stopType) {
      case SpotType.travelSpot:
        {
          this.stopText = "Travel Spot";
          this.iconData = Icons.landscape;
          this.isTravelSpot = true;
        }
        break;
      case SpotType.hotel:
        {
          this.stopText = "Hotel";
          this.iconData = Icons.hotel;
        }
        break;
      case SpotType.restaurant:
        {
          this.stopText = "Restaurant";
          this.iconData = Icons.fastfood;
        }
        break;
      case SpotType.fuelStation:
        {
          this.stopText = "Fuel Station";
          this.iconData = Icons.local_gas_station;
        }
        break;
      case SpotType.bank:
        {
          this.stopText = "Bank";
          this.iconData = Icons.money;
        }
        break;
    }
  }
}

// List<StopBySpot> stopBySpots = [stopBySpot0, stopBySpot1, stopBySpot2];

StopBySpot stopBySpot0 = StopBySpot(
  stopType: SpotType.hotel,
  areaName: "Kaghan",
  rating: 2,
);

StopBySpot stopBySpot1 = StopBySpot(
  stopType: SpotType.restaurant,
  areaName: "Naran",
  rating: 4,
);

StopBySpot stopBySpot2 = StopBySpot(
  stopType: SpotType.travelSpot,
  areaName: "Babusar Top",
  rating: 4.5,
);
