class SpotLocation {
  final String cityOrTown;
  final String country;

  const SpotLocation({
    required this.cityOrTown,
    required this.country,
  });

  String get fullLocation {
    return cityOrTown + ", " + country;
  }
}
