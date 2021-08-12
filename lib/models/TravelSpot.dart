import 'package:flutter/material.dart';
import 'package:nowrth/models/Guide.dart';
import 'package:nowrth/models/stop_by_spot.dart';

class TravelSpot {
  final String name;
  final String location;
  final double rating;
  final List<String> images;
  final List<Guide> guides;
  final List<StopBySpot> stopBySpots;
  final String details;

  TravelSpot({
    @required this.name,
    @required this.location,
    @required this.rating,
    @required this.images,
    @required this.guides,
    @required this.stopBySpots,
    @required this.details,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    name: "Red Mountains",
    location: "London, England",
    images: images1,
    rating: 4.5,
    guides: guidesList1..shuffle(),
    stopBySpots: stopBySpotsList1..shuffle(),
    details: (details..shuffle())[0],
  ),
  TravelSpot(
    name: "Magical World",
    location: "Lisbon, Portugal",
    images: images2,
    rating: 2.5,
    guides: guidesList2..shuffle(),
    stopBySpots: stopBySpotsList2..shuffle(),
    details: (details..shuffle())[0],
  ),
  TravelSpot(
    name: "Black Mountains",
    location: "Paris, France",
    rating: 3.5,
    images: images3,
    guides: guidesList3..shuffle(),
    stopBySpots: stopBySpotsList3..shuffle(),
    details: (details..shuffle())[0],
  ),
];

List<String> images1 = [
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
];
List<String> images2 = [
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
];
List<String> images3 = [
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
];

List<Guide> guidesList1 = [guide1, guide2, guide3, guide4, guide5];
List<Guide> guidesList2 = [guide1, guide2, guide3, guide4, guide5];
List<Guide> guidesList3 = [guide1, guide2, guide3, guide4, guide5];

List<StopBySpot> stopBySpotsList1 = [stopBySpot1, stopBySpot2, stopBySpot3];
List<StopBySpot> stopBySpotsList2 = [stopBySpot1, stopBySpot2, stopBySpot3];
List<StopBySpot> stopBySpotsList3 = [stopBySpot1, stopBySpot2, stopBySpot3];

List<String> details = [
  "Pellentesque in ipsum id orci porta dapibus. "
      "Nulla porttitor accumsan tincidunt. Donec rutrum "
      "congue leo eget malesuada. "
      "\n\nPraesent sapien massa, convallis a pellentesque "
      "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
      "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
      "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
      "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
      "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  "Pellentesque in ipsum id orci porta dapibus. "
      "Nulla porttitor accumsan tincidunt. Donec rutrum "
      "congue leo eget malesuada. "
      "\nPraesent sapien massa, convallis a pellentesque "
      "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
      "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
      "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
      "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
      "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  "Pellentesque in ipsum id orci porta dapibus. "
      "Nulla porttitor accumsan tincidunt. Donec rutrum "
      "congue leo eget malesuada. "
      "\n\nPraesent sapien massa, convallis a pellentesque "
      "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
      "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
      "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
      "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
      "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  "Pellentesque in ipsum id orci porta dapibus. "
      "Nulla porttitor accumsan tincidunt. Donec rutrum "
      "congue leo eget malesuada. "
      "\nPraesent sapien massa, convallis a pellentesque "
      "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
      "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
      "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
      "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
      "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  "Pellentesque in ipsum id orci porta dapibus. "
      "Nulla porttitor accumsan tincidunt. Donec rutrum "
      "congue leo eget malesuada. "
      "\nPraesent sapien massa, convallis a pellentesque "
      "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
      "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
      "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
      "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
      "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
];
