import 'package:nowrth/models/travel_spot.dart';

List<String> likedSpotIds = ["0001", "0002", "0003"];
List<String> contributedSpotIds = ["0001", "0002", "0003"];

List<TravelSpot> likedSpots = travelSpots
    .where((element) => likedSpotIds.contains(element.spotID))
    .toList();

List<TravelSpot> contributedSpots = travelSpots
    .where((element) => contributedSpotIds.contains(element.spotID))
    .toList();
