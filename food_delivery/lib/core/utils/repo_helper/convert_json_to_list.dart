import 'package:dio/dio.dart';

List<T> convertJsonToList<T>(
  Response response,
  T Function(Map<String, dynamic>) parser,
) {
  final List<Map<String, dynamic>> json = List<Map<String, dynamic>>.from(
    response.data,
  );

  final List<T> dataList = json.map((itemAsJson) {
    return fromJson(itemAsJson, parser);
  }).toList();

  return dataList;
}


T fromJson<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic>) parser,
) {
  return parser(json);
}
