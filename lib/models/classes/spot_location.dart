class Coordinates {
  final double latitude;
  final double longitude;

  // TODO: make latitude and longitude required, based on which the server will provide the cityOrTown and country of the spot
  const Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class Address {
  final String cityOrTown;
  final String country;

  const Address({
    required this.cityOrTown,
    required this.country,
  });

  String get fullLocation {
    return '$cityOrTown, $country';
  }
}
