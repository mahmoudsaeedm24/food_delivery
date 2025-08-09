
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetLocationWithName extends StatefulWidget {
  const GetLocationWithName({super.key});

  @override
  State<GetLocationWithName> createState() => _GetLocationWithNameState();
}

class _GetLocationWithNameState extends State<GetLocationWithName> {
  TextEditingController controller = TextEditingController();
  List places = [];
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: (placeName) async {
              final place = await dio.get(
                'https://nominatim.openstreetmap.org/search?q=$placeName&format=json&limit=5',
                options: Options(headers: {'User-Agent': 'delivery_food_app'}),
              );
              setState(() {
                places = place.data;
              });

            },
          ),
          ListOfSuggesstion(places: places),
        ],
      ),
    );
  }
}

class ListOfSuggesstion extends StatelessWidget {
  const ListOfSuggesstion({super.key, required this.places});
  final List places;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: places.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(places[index]['display_name']),
            subtitle: Text(places[index]['name']),
          );
        },
      ),
    );
  }
}
