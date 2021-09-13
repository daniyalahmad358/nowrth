class SpotLocation {
  final String cityOrTown;
  final String country;
  final String latitude;
  final String longitude;

  // TODO: make latitude and longitude required, based on which the server will provide the cityOrTown and country of the spot
  const SpotLocation({
    this.cityOrTown = 'Lahore',
    this.country = 'Pakistan',
    this.latitude = 'X',
    this.longitude = 'Y',
  });

  String get fullLocation {
    return '$cityOrTown, $country';
  }
}
