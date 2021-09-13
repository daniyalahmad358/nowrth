import 'package:flutter/widgets.dart';

import 'package:nowrth/models/spot_type.dart';

class Contribution {
  final String spotName;
  final SpotType spotType;

  final String location;
  final String latitude;
  final String longitude;
  final List<Image> images;
  final String? description;

  const Contribution({
    required this.spotName,
    required this.spotType,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.images,
    this.description,
  });
}
