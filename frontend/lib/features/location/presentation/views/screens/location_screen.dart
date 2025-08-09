import 'package:flutter/material.dart';
import 'package:frontend/core/utils/permissions.dart';
import 'package:frontend/features/location/presentation/views/widgets/current_location.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});
  Future<Position> currPosition(context) async {
    if (await Permissions.checkLocationPermission(context)) {
      return Geolocator.getCurrentPosition();
    } else {
      throw "Error happened here";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: currPosition(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CurrentLocation(currPosition: snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
