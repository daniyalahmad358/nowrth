import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/spot.dart';

import 'package:nowrth/temp/spot/spot.dart';

List<UniqueKey> likedSpotIds = [
  allSpots[0].spotID,
  allSpots[1].spotID,
  allSpots[2].spotID,
];
List<UniqueKey> contributedSpotIds = [
  allSpots[0].spotID,
  allSpots[1].spotID,
  allSpots[2].spotID,
];

List<Spot> likedSpots =
    allSpots.where((element) => likedSpotIds.contains(element.spotID)).toList();

List<Spot> contributedSpots = allSpots
    .where((element) => contributedSpotIds.contains(element.spotID))
    .toList();
