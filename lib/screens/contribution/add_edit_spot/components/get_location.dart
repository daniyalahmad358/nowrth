import 'package:location/location.dart';
import 'package:nowrth/models/classes/spot_location.dart';

Future<Coordinates?> getSpotLocation() async {
  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  _locationData = await location.getLocation();

  return Coordinates(
    latitude: _locationData.latitude ?? 0.0,
    longitude: _locationData.longitude ?? 0.0,
  );
}
