import 'package:flutter/widgets.dart';
import 'package:nowrth/models/spot.dart';

import 'package:nowrth/temp/spot/spot.dart';

List<UniqueKey> likedSpotIds = [
  travelSpots[0].spotID,
  travelSpots[1].spotID,
  travelSpots[2].spotID,
];
List<UniqueKey> contributedSpotIds = [
  travelSpots[0].spotID,
  travelSpots[1].spotID,
  travelSpots[2].spotID,
];

List<Spot> likedSpots = travelSpots
    .where((element) => likedSpotIds.contains(element.spotID))
    .toList();

List<Spot> contributedSpots = travelSpots
    .where((element) => contributedSpotIds.contains(element.spotID))
    .toList();
