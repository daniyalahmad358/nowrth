import 'package:flutter/material.dart';

import 'package:nowrth/models/classes/guide.dart';
import 'package:nowrth/models/classes/spot_location.dart';

import 'package:nowrth/models/enums/spot_type.dart';

class Spot {
  final UniqueKey spotID;
  String spotName;
  SpotType spotType;
  Coordinates spotCoordinates;
  Address address;
  List<Image> images;
  double rating;
  List<Guide>? guides;
  List<Spot>? stopBySpots;
  String? description;

  String? spotTypeDisplayText;
  IconData? iconData;

  Spot({
    required this.spotID,
    required this.spotName,
    required this.spotType,
    required this.spotCoordinates,
    required this.address,
    required this.rating,
    required this.images,
    this.guides,
    this.description,
    this.stopBySpots,
  }) {
    switch (spotType) {
      case SpotType.travelSpot:
        {
          spotTypeDisplayText = 'Travel Spot';
          iconData = Icons.landscape;
        }
        break;
      case SpotType.hotel:
        {
          spotTypeDisplayText = 'Hotel';
          iconData = Icons.hotel;
        }
        break;
      case SpotType.restaurant:
        {
          spotTypeDisplayText = 'Restaurant';
          iconData = Icons.fastfood;
        }
        break;
      case SpotType.fuelStation:
        {
          spotTypeDisplayText = 'Fuel Station';
          iconData = Icons.local_gas_station;
        }
        break;
      case SpotType.bank:
        {
          spotTypeDisplayText = 'Bank';
          iconData = Icons.money;
        }
        break;
    }
  }
}
