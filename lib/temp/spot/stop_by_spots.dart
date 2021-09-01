import 'package:flutter/widgets.dart';
import 'package:nowrth/models/spot.dart';
import 'package:nowrth/temp/spot/spot.dart';

import 'package:nowrth/temp/spot/spot_type.dart';

// List<Spot> stopBySpots = [stopBySpot0, stopBySpot1, stopBySpot2];

Spot stopBySpot0 = Spot(
  spotID: UniqueKey(),
  spotType: SpotType.hotel,
  location: "Kaghan",
  rating: 2,
  spotName: "Hotel",
  images: images1,
);

Spot stopBySpot1 = Spot(
  spotID: UniqueKey(),
  spotType: SpotType.restaurant,
  location: "Naran",
  rating: 4,
  images: images0,
);

Spot stopBySpot2 = Spot(
  spotID: UniqueKey(),
  spotType: SpotType.travelSpot,
  location: "Babusar Top",
  rating: 4.5,
  images: images2,
);
