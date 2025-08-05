import 'package:latlong2/latlong.dart';

class MyLatLng extends LatLng {
  MyLatLng(super.latitude, super.longitude);

  ///* [ fromList ] take a List paramter that store [lat , long]
  static MyLatLng fromList(List<String> latlng) {
    final lat = double.parse(latlng[0]);
    final long = double.parse(latlng[1]);
    if (lat.isNaN ||
        lat.isNegative ||
        lat.isInfinite ||
        long.isNaN ||
        long.isNegative ||
        long.isInfinite) {
      throw "Error in values of List passed";
    }
    return MyLatLng(lat, long);
  }

  factory MyLatLng.fromLatLng(LatLng latlng) {
    return MyLatLng(latlng.latitude, latlng.longitude);
  }

  String toStringAsBraces() =>
      '(${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)})';

  List<String> toListString() => [
    latitude.toStringAsFixed(5),
    longitude.toStringAsFixed(5),
  ];
}
