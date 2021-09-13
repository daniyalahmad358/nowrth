import 'package:flutter/material.dart';

import 'package:nowrth/models/guide.dart';
import 'package:nowrth/models/spot_location.dart';

import 'package:nowrth/models/spot_type.dart';

class Spot {
  final UniqueKey spotID;
  String spotName;
  SpotType spotType;
  SpotLocation spotLocation;
  List<Image> images;
  double rating;
  List<Guide>? guides;
  List<Spot>? stopBySpots;
  String? description;

  String? spotTypeDesiplayText;
  IconData? iconData;

  Spot({
    required this.spotID,
    required this.spotName,
    required this.spotType,
    required this.spotLocation,
    required this.rating,
    required this.images,
    this.guides,
    this.description,
    this.stopBySpots,
  }) {
    switch (spotType) {
      case SpotType.travelSpot:
        {
          spotTypeDesiplayText = 'Travel Spot';
          iconData = Icons.landscape;
        }
        break;
      case SpotType.hotel:
        {
          spotTypeDesiplayText = 'Hotel';
          iconData = Icons.hotel;
        }
        break;
      case SpotType.restaurant:
        {
          spotTypeDesiplayText = 'Restaurant';
          iconData = Icons.fastfood;
        }
        break;
      case SpotType.fuelStation:
        {
          spotTypeDesiplayText = 'Fuel Station';
          iconData = Icons.local_gas_station;
        }
        break;
      case SpotType.bank:
        {
          spotTypeDesiplayText = 'Bank';
          iconData = Icons.money;
        }
        break;
    }
  }
}
