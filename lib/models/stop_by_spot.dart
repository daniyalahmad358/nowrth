import 'package:flutter/material.dart';

class StopBySpot {
  final StopBySpotType stopType;
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
    // if (this.spotType == )
    switch (this.stopType) {
      case StopBySpotType.travelSpot:
        {
          this.stopText = "Travel Spot";
          this.iconData = Icons.landscape;
          this.isTravelSpot = true;
        }
        break;
      case StopBySpotType.hotel:
        {
          this.stopText = "Hotel";
          this.iconData = Icons.hotel;
        }
        break;
      case StopBySpotType.restaurant:
        {
          this.stopText = "Restaurant";
          this.iconData = Icons.fastfood;
        }
        break;
      case StopBySpotType.fuelStation:
        {
          this.stopText = "Fuel Station";
          this.iconData = Icons.local_gas_station;
        }
        break;
      case StopBySpotType.bank:
        {
          this.stopText = "Bank";
          this.iconData = Icons.money;
        }
        break;
    }
  }
}

enum StopBySpotType {
  travelSpot,
  hotel,
  restaurant,
  fuelStation,
  bank,
}

// Map<String, String> spotTypes = {
//   "hotel": "Hotel",
//   "restaurant": "Restaurant",
//   "travelSpot": "Travel Spot",
//   "fuelStation": "Fuel Station",
//   "bank": "Bank",
// };

// List<StopBySpot> stopBySpots = [stopBySpot0, stopBySpot1, stopBySpot2];

StopBySpot stopBySpot0 = StopBySpot(
  stopType: StopBySpotType.hotel,
  areaName: "Kaghan",
  rating: 2,
);

StopBySpot stopBySpot1 = StopBySpot(
  stopType: StopBySpotType.restaurant,
  areaName: "Naran",
  rating: 4,
);

StopBySpot stopBySpot2 = StopBySpot(
  stopType: StopBySpotType.travelSpot,
  areaName: "Babusar Top",
  rating: 4.5,
);
