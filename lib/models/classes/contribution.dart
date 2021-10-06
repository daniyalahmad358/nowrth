import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/models/classes/spot_type.dart';
import 'package:nowrth/utils/image_utils.dart';

class Contribution {
  final int id;
  final String name;
  final SpotType spotType;
  final Coordinates coordinates;
  final Address address;
  final String description;
  final List<String> imageBase64s;

  Contribution({
    required this.id,
    required this.name,
    required this.spotType,
    required this.coordinates,
    required this.address,
    required this.description,
    required this.imageBase64s,
  });
}

class ContributionListItem {
  late int id;
  late String name;
  late Address address;
  late ImageProvider thumbnail;
  late int spotTypeIconCode;
  late int statusIconCode;

  ContributionListItem({
    required this.id,
    required this.name,
    required this.address,
    required this.thumbnail,
    required this.spotTypeIconCode,
    required this.statusIconCode,
  });

  ContributionListItem.fromContribution({
    required Contribution contribution,
    required int newStatusIconCode,
  }) {
    id = contribution.id;
    name = contribution.name;
    address = contribution.address;
    thumbnail = ImageUtils.base64ToImg(contribution.imageBase64s[0]);
    spotTypeIconCode = contribution.spotType.iconCode;
    statusIconCode = newStatusIconCode;
  }
}
