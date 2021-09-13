import 'dart:math';

import 'package:nowrth/models/spot_location.dart';

int getSpotRouteDistance(
    {required SpotLocation locationA, required SpotLocation locationB}) {
  List<int> randomDistances = [45, 24, 36, 19, 28, 26];

  return randomDistances[Random().nextInt(randomDistances.length)];
}
