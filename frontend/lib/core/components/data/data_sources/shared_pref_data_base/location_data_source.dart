import 'package:frontend/core/utils/keys.dart';
import 'package:frontend/core/utils/my_lat_lng.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationDataSource {
  static Future<bool> storeLocation(MyLatLng latlng) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(
      Keys.locationLatLongKey,
      latlng.toListString(),
    );
  }

  static Future<MyLatLng> getLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? res = prefs.getStringList(Keys.locationLatLongKey);
    if (res != null) {
      MyLatLng loc = MyLatLng.fromList(res);
      return loc;
    } else {
      throw "error in GetLocation method list";
    }
  }

  static Future<bool> clearLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(Keys.locationLatLongKey);
  }
}
