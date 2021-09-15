import 'dart:math';

import 'package:nowrth/models/classes/spot_location.dart';

String getSpotRouteDistance(
    {required SpotLocation locationA, required SpotLocation locationB}) {
  List<int> randomDistances = [45, 24, 36, 19, 28, 26];

  return randomDistances[Random().nextInt(randomDistances.length)].toString() +
      ' km';
}
