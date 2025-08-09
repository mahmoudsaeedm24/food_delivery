import 'package:frontend/core/utils/my_lat_lng.dart';
import 'package:latlong2/latlong.dart';

extension LatLngToMyLatLng on LatLng {
  MyLatLng toMyLatLng() => MyLatLng(latitude, longitude);
}

@Deprecated("No longer use this file , you can use [MyLatLong] instead")
extension LatLngToListString on LatLng {
  List<String> toListString() => [
    latitude.toStringAsFixed(5),
    longitude.toStringAsFixed(5),
  ];
}

@Deprecated("No longer use this file , you can use [MyLatLong] instead")
extension LatLngToString on LatLng {
  String toStringAsBraces() =>
      '(${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)})';
}
