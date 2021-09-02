import 'package:flutter/material.dart';

import 'package:nowrth/models/guide.dart';
import 'package:nowrth/models/spot_location.dart';

import 'package:nowrth/temp/spot/spot_type.dart';

class Spot {
  final UniqueKey spotID;
  final String spotName;
  final SpotType spotType;
  final SpotLocation spotLocation;
  final double rating;
  final List<String> images;
  final List<Guide>? guides;
  final List<Spot>? stopBySpots;
  final String? description;

  String? spotTypeDesiplayText;
  IconData? iconData;

  Spot({
    required this.spotID,
    required this.spotType,
    required this.spotLocation,
    required this.rating,
    required this.images,
    required this.spotName,
    this.guides,
    this.description,
    this.stopBySpots,
  }) {
    switch (this.spotType) {
      case SpotType.travelSpot:
        {
          this.spotTypeDesiplayText = "Travel Spot";
          this.iconData = Icons.landscape;
        }
        break;
      case SpotType.hotel:
        {
          this.spotTypeDesiplayText = "Hotel";
          this.iconData = Icons.hotel;
        }
        break;
      case SpotType.restaurant:
        {
          this.spotTypeDesiplayText = "Restaurant";
          this.iconData = Icons.fastfood;
        }
        break;
      case SpotType.fuelStation:
        {
          this.spotTypeDesiplayText = "Fuel Station";
          this.iconData = Icons.local_gas_station;
        }
        break;
      case SpotType.bank:
        {
          this.spotTypeDesiplayText = "Bank";
          this.iconData = Icons.money;
        }
        break;
    }
  }
}
