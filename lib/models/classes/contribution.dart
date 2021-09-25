import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nowrth/models/classes/spot_location.dart';
import 'package:nowrth/models/classes/spot_type.dart';

class Contribution {
  final int id;
  final String name;
  final SpotType spotType;
  final Coordinates coordinates;
  final String description;
  final List<String> imageBase64s;
  final int statusIconCode;
  final int spotTypeIconCode;

  Contribution({
    required this.id,
    required this.name,
    required this.spotType,
    required this.coordinates,
    required this.description,
    required this.imageBase64s,
    required this.statusIconCode,
    required this.spotTypeIconCode,
  });
}

class ContributionListItem {
  late int id;
  late String name;
  late Address address;
  late ImageProvider thumbnail;
  late int statusIconCode;
  late int spotTypeIconCode;

  ContributionListItem({
    required this.id,
    required this.name,
    required this.address,
    required this.thumbnail,
    required this.statusIconCode,
    required this.spotTypeIconCode,
  });

  /*
    // ContributionListItem.fromContribution(Contribution contribution) {
    //   id = contribution.id;
    //   name = contribution.name;
    //   address = contribution.address;
    //   thumbnail = contribution.images[0];
    //   statusIconCode = contribution.statusIconCode;
    //   spotTypeIconCode = contribution.spotTypeIconCode;
    // }
  */
}
