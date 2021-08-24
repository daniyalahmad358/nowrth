import 'package:nowrth/models/guide.dart';
import 'package:nowrth/models/stop_by_spot.dart';

class TravelSpot {
  final String name;
  final String location;
  final double rating;
  final List<String> images;
  final List<Guide> guides;
  final List<StopBySpot> stopBySpots;
  final String details;
  bool isLiked;

  TravelSpot({
    required this.name,
    required this.location,
    required this.rating,
    required this.images,
    required this.guides,
    required this.stopBySpots,
    required this.details,
    required this.isLiked,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    name: "Red Mountains",
    location: "London, England",
    images: images0,
    rating: 4.5,
    guides: guidesList0..shuffle(),
    stopBySpots: stopBySpotsList0..shuffle(),
    details: details[0],
    isLiked: true,
  ),
  TravelSpot(
    name: "Khunjerab Pass",
    location: "Gilgit, Pakistan",
    rating: 4,
    images: images1,
    guides: guidesList1..shuffle(),
    stopBySpots: stopBySpotsList1..shuffle(),
    details: details[1],
    isLiked: true,
  ),
  TravelSpot(
    name: "Black Mountains",
    location: "Paris, France",
    rating: 3.5,
    images: images2,
    guides: guidesList2..shuffle(),
    stopBySpots: stopBySpotsList2..shuffle(),
    details: details[2],
    isLiked: true,
  ),
  TravelSpot(
    name: "Magical World",
    location: "Lisbon, Portugal",
    images: images3,
    rating: 2.5,
    guides: guidesList3..shuffle(),
    stopBySpots: stopBySpotsList3..shuffle(),
    details: details[3],
    isLiked: false,
  ),
];

List<String> images0 = [
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
];
List<String> images1 = [
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
];
List<String> images2 = [
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
];
List<String> images3 = [
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
  "assets/images/Magical_World.png",
  "assets/images/Red_Mountains.png",
];

List<Guide> guidesList0 = [guide0, guide1, guide2, guide3, guide4];
List<Guide> guidesList1 = [guide0, guide1, guide2, guide3, guide4];
List<Guide> guidesList2 = [guide0, guide1, guide2, guide3, guide4];
List<Guide> guidesList3 = [guide0, guide1, guide2, guide3, guide4];

List<StopBySpot> stopBySpotsList0 = [stopBySpot0, stopBySpot1, stopBySpot2];
List<StopBySpot> stopBySpotsList1 = [stopBySpot0, stopBySpot1, stopBySpot2];
List<StopBySpot> stopBySpotsList2 = [stopBySpot0, stopBySpot1, stopBySpot2];
List<StopBySpot> stopBySpotsList3 = [stopBySpot0, stopBySpot1, stopBySpot2];

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
];

List<TravelSpot> likedTravelSpots =
    travelSpots.where((element) => element.isLiked).toList();
