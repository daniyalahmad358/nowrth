import 'package:flutter/material.dart';

class StopBySpot {
  final String name;
  final stopType;
  final IconData iconData;
  final bool isTravelSpot;

  StopBySpot({
    @required this.name,
    @required this.iconData,
    @required this.stopType,
    this.isTravelSpot,
  });
}

enum SpotTypes {
  hotel,
  restraunt,
  travelSpot,
  fuelStation,
  Bank,
}

List<StopBySpot> stopBySpots = [stopBySpot1, stopBySpot2, stopBySpot3];

StopBySpot stopBySpot1 = StopBySpot(
  name: "Swat Restraunt",
  stopType: SpotTypes.hotel,
  iconData: Icons.fastfood,
  isTravelSpot: false,
);

StopBySpot stopBySpot2 = StopBySpot(
  name: "Magical World",
  stopType: "Restraunt",
  iconData: Icons.hotel,
  isTravelSpot: false,
);

StopBySpot stopBySpot3 = StopBySpot(
  name: "Red Mountains",
  stopType: "PicnicSpot",
  iconData: Icons.landscape,
  isTravelSpot: false,
);
