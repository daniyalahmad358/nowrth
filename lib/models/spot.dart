// import 'package:flutter/material.dart';

// class Spot {
//   final StopBySpotType stopType;
//   final String areaName;
//   final double rating;

//   String? stopText;
//   IconData? iconData;
//   bool? isTravelSpot = false;

//   final String spotName;
//   final String location;
//   final double rating;
//   final List<String> images;
//   final String details;
//   bool isLiked;

//   Spot({
//     required this.stopType,
//     required this.areaName,
//     required this.rating,
//   }) {
//     switch (this.stopType) {
//       case StopBySpotType.travelSpot:
//         {
//           this.stopText = "Travel Spot";
//           this.iconData = Icons.landscape;
//           this.isTravelSpot = true;
//         }
//         break;
//       case StopBySpotType.hotel:
//         {
//           this.stopText = "Hotel";
//           this.iconData = Icons.hotel;
//         }
//         break;
//       case StopBySpotType.restaurant:
//         {
//           this.stopText = "Restaurant";
//           this.iconData = Icons.fastfood;
//         }
//         break;
//       case StopBySpotType.fuelStation:
//         {
//           this.stopText = "Fuel Station";
//           this.iconData = Icons.local_gas_station;
//         }
//         break;
//       case StopBySpotType.bank:
//         {
//           this.stopText = "Bank";
//           this.iconData = Icons.money;
//         }
//         break;
//     }
//   }
// }

// enum StopBySpotType {
//   travelSpot,
//   hotel,
//   restaurant,
//   fuelStation,
//   bank,
// }

// // List<StopBySpot> stopBySpots = [stopBySpot0, stopBySpot1, stopBySpot2];

// Spot stopBySpot0 = Spot(
//   stopType: StopBySpotType.hotel,
//   areaName: "Kaghan",
//   rating: 2,
// );

// Spot stopBySpot1 = Spot(
//   stopType: StopBySpotType.restaurant,
//   areaName: "Naran",
//   rating: 4,
// );

// Spot stopBySpot2 = Spot(
//   stopType: StopBySpotType.travelSpot,
//   areaName: "Babusar Top",
//   rating: 4.5,
// );

enum SpotType {
  travelSpot,
  hotel,
  restaurant,
  fuelStation,
  bank,
}

extension SpotTypeExtension on SpotType {
  String? get value {
    switch (this) {
      case SpotType.travelSpot:
        return "Travel Spot";
      case SpotType.hotel:
        return "Hotel";
      case SpotType.restaurant:
        return "Restaurant";
      case SpotType.fuelStation:
        return "Fuel Station";
      case SpotType.bank:
        return "Bank";
      default:
        return null;
    }
  }
}

// List<String> spotTypeValues = <String>[
//   SpotType.travelSpot.value!,
//   SpotType.hotel.value!,
//   SpotType.restaurant.value!,
//   SpotType.fuelStation.value!,
//   SpotType.bank.value!,
// ];

List<String> get spotTypeValues {
  return <String>[
    SpotType.travelSpot.value!,
    SpotType.hotel.value!,
    SpotType.restaurant.value!,
    SpotType.fuelStation.value!,
    SpotType.bank.value!,
  ];
}
