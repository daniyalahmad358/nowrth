import 'package:flutter/widgets.dart';

import 'package:nowrth/models/guide.dart';
import 'package:nowrth/models/spot_location.dart';
import 'package:nowrth/models/spot.dart';

import 'package:nowrth/temp/guides.dart';
import 'package:nowrth/models/spot_type.dart';

List<Image> images0 = [
  Image.asset('assets/images/Red_Mountains.png'),
  Image.asset('assets/images/Magical_World.png'),
  Image.asset('assets/images/Red_Mountains.png'),
  Image.asset('assets/images/Magical_World.png'),
];
List<Image> images1 = [
  Image.asset('assets/images/Magical_World.png'),
  Image.asset('assets/images/Red_Mountains.png'),
  Image.asset('assets/images/Magical_World.png'),
  Image.asset('assets/images/Red_Mountains.png'),
];
List<Image> images2 = [
  Image.asset('assets/images/Red_Mountains.png'),
  Image.asset('assets/images/Magical_World.png'),
  Image.asset('assets/images/Red_Mountains.png'),
  Image.asset('assets/images/Magical_World.png'),
];
List<Image> images3 = [
  Image.asset('assets/images/Magical_World.png'),
  Image.asset('assets/images/Red_Mountains.png'),
  Image.asset('assets/images/Magical_World.png'),
  Image.asset('assets/images/Red_Mountains.png'),
];

List<Guide> guidesList0 = [guide0, guide1, guide2, guide3, guide4];
List<Guide> guidesList1 = [guide0, guide1, guide2, guide3, guide4];
List<Guide> guidesList2 = [guide0, guide1, guide2, guide3, guide4];
List<Guide> guidesList3 = [guide0, guide1, guide2, guide3, guide4];

List<String> details = [
  'Pellentesque in ipsum id orci porta dapibus. '
      'Nulla porttitor accumsan tincidunt. Donec rutrum '
      'congue leo eget malesuada. '
      '\n\nPraesent sapien massa, convallis a pellentesque '
      'nec, egestas non nisi. Donec rutrum congue leo eget malesuada. '
      'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. '
      'Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. '
      '\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. '
      'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',
  'Pellentesque in ipsum id orci porta dapibus. '
      'Nulla porttitor accumsan tincidunt. Donec rutrum '
      'congue leo eget malesuada. '
      '\nPraesent sapien massa, convallis a pellentesque '
      'nec, egestas non nisi. Donec rutrum congue leo eget malesuada. '
      'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. '
      'Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. '
      '\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. '
      'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',
  'Pellentesque in ipsum id orci porta dapibus. '
      'Nulla porttitor accumsan tincidunt. Donec rutrum '
      'congue leo eget malesuada. '
      '\n\nPraesent sapien massa, convallis a pellentesque '
      'nec, egestas non nisi. Donec rutrum congue leo eget malesuada. '
      'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. '
      'Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. '
      '\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. '
      'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',
  'Pellentesque in ipsum id orci porta dapibus. '
      'Nulla porttitor accumsan tincidunt. Donec rutrum '
      'congue leo eget malesuada. '
      '\nPraesent sapien massa, convallis a pellentesque '
      'nec, egestas non nisi. Donec rutrum congue leo eget malesuada. '
      'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. '
      'Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. '
      '\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. '
      'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',
];

List<Spot> stopBySpotsList0 = [
  spot4,
  spot5,
  spot6,
  spot5,
  spot6,
  spot4,
  spot4,
];
List<Spot> stopBySpotsList1 = [
  spot4,
  spot5,
  spot6,
];
List<Spot> stopBySpotsList2 = [
  spot4,
  spot5,
  spot6,
];
List<Spot> stopBySpotsList3 = [
  spot4,
  spot5,
  spot6,
];

Spot spot0 = Spot(
  spotID: UniqueKey(),
  spotName: 'Red Mountains',
  spotLocation: const SpotLocation(cityOrTown: 'London', country: 'England'),
  images: images0,
  rating: 5,
  guides: guidesList0..shuffle(),
  stopBySpots: stopBySpotsList0..shuffle(),
  description: details[0],
  spotType: SpotType.travelSpot,
);
Spot spot1 = Spot(
  spotID: UniqueKey(),
  spotName: 'Khunjerab Pass',
  spotLocation: const SpotLocation(cityOrTown: 'Gilgit', country: 'Pakistan'),
  rating: 4.5,
  images: images1,
  guides: guidesList1..shuffle(),
  stopBySpots: stopBySpotsList1..shuffle(),
  description: details[1],
  spotType: SpotType.travelSpot,
);
Spot spot2 = Spot(
  spotID: UniqueKey(),
  spotName: 'Black Mountains',
  spotLocation: const SpotLocation(cityOrTown: 'Paris', country: 'France'),
  rating: 4.5,
  images: images2,
  guides: guidesList2..shuffle(),
  stopBySpots: stopBySpotsList2..shuffle(),
  description: details[2],
  spotType: SpotType.travelSpot,
);
Spot spot3 = Spot(
  spotID: UniqueKey(),
  spotName: 'Magical World',
  spotLocation: const SpotLocation(cityOrTown: 'Lisbon', country: 'Portugal'),
  images: images3,
  rating: 4,
  guides: guidesList3..shuffle(),
  stopBySpots: stopBySpotsList3..shuffle(),
  description: details[3],
  spotType: SpotType.travelSpot,
);
Spot spot4 = Spot(
  spotName: 'Kaghan Hotel',
  spotID: UniqueKey(),
  spotType: SpotType.hotel,
  spotLocation: const SpotLocation(cityOrTown: 'Kaghan', country: 'Pakistan'),
  rating: 2,
  images: images1,
);
Spot spot5 = Spot(
  spotName: 'Naran Taste Point',
  spotID: UniqueKey(),
  spotType: SpotType.restaurant,
  spotLocation: const SpotLocation(cityOrTown: 'Naran', country: 'Pakistan'),
  rating: 4,
  images: images0,
);
Spot spot6 = Spot(
  spotName: 'Babusar Top',
  spotID: UniqueKey(),
  spotType: SpotType.travelSpot,
  spotLocation:
      const SpotLocation(cityOrTown: 'Babusar Top', country: 'Pakistan'),
  rating: 3.5,
  images: images2,
);

List<Spot> allSpots = [spot0, spot1, spot2, spot3, spot4, spot5, spot6];

List<Spot> travelSpots = allSpots
    .where((element) => element.spotType == SpotType.travelSpot)
    .toList();
List<Spot> topTravelSpots =
    travelSpots.where((element) => element.rating >= 4).toList();
