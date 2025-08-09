import 'package:frontend/core/utils/my_lat_lng.dart';
import 'package:geolocator/geolocator.dart';

extension PositionExtension on Position {
  MyLatLng latlng() => MyLatLng(latitude, longitude);
  // Position latlng () => Position(longitude: longitude, latitude: latitude, timestamp: timestamp, accuracy: accuracy, altitude: altitude, altitudeAccuracy: altitudeAccuracy, heading: heading, headingAccuracy: headingAccuracy, speed: speed, speedAccuracy: speedAccuracy)
}
