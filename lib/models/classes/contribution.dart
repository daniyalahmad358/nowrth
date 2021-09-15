class Contribution {
  final String spotName;
  final String spotTypeString;
  final String latitude;
  final String longitude;
  final String description;
  final List<String> imagesBase64;

  const Contribution({
    required this.spotName,
    required this.spotTypeString,
    required this.latitude,
    required this.longitude,
    this.description = "",
    required this.imagesBase64,
  });
}
