import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/core/components/data/data_sources/shared_pref_data_base/location_data_source.dart';
import 'package:frontend/core/utils/extensions/lat_lng_extension.dart';
import 'package:frontend/core/utils/extensions/position_extension.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key, required this.currPosition});
  final Position currPosition;
  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  LatLng? newCurrentPosition;
  @override
  void initState() {
    super.initState();
    newCurrentPosition = widget.currPosition.latlng();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
          onLongPress: (tapPosition, point) async {
            final bool res = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Change your location"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        newCurrentPosition = point;
                      });

                      final res = await LocationDataSource.storeLocation(
                        point.toMyLatLng(),
                      );
                      Navigator.pop(context, res);
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('No'),
                  ),
                ],
              ),
            );

            if (!res) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("refused store location")));
            }
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
            userAgentPackageName: 'com.example.frontend',
          ),
          MarkerLayer(markers: [
            ],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: newCurrentPosition ?? widget.currPosition.latlng(),
                radius: 10,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
