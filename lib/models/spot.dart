import 'package:flutter/material.dart';

import 'package:nowrth/models/guide.dart';
import 'package:nowrth/temp/spot/spot_type.dart';

class Spot {
  final String? spotName;
  final SpotType spotType;
  final String location;
  final double rating;
  final List<String> images;
  final List<Guide>? guides;
  final List<Spot>? stopBySpots;
  final String? details;
  final UniqueKey spotID;

  String? stopText;
  IconData? iconData;

  Spot({
    required this.spotID,
    required this.spotType,
    required this.location,
    required this.rating,
    required this.images,
    this.spotName,
    this.guides,
    this.details,
    this.stopBySpots,

    // required this.isLiked,
  }) {
    switch (this.spotType) {
      case SpotType.travelSpot:
        {
          this.stopText = "Travel Spot";
          this.iconData = Icons.landscape;
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
