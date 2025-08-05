import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:food_delivery/core/utils/keys.dart';

class CategoryModel extends Equatable {
  final String? id;
  final String title;
  final String iconCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.iconCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.defaultCategory() {
    return CategoryModel(
      id: "all",
      title: "All",
      iconCode: '0xe318',
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
    );
  }

  CategoryModel copyWith({
    String? id,
    String? title,
    String? iconCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iconCode: iconCode ?? this.iconCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ModelKeys.id: id,
      ModelKeys.title: title,
      ModelKeys.iconCode: iconCode,
      ModelKeys.createdAt: createdAt?.toIso8601String(),
      ModelKeys.updatedAt: updatedAt?.toIso8601String(),
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    log("Type of createdAt : ${map[ModelKeys.createdAt].runtimeType}");
    return CategoryModel(
      id: map[ModelKeys.id] as String,
      title: map[ModelKeys.title] as String,
      iconCode: map[ModelKeys.iconCode] as String,
      createdAt: DateTime.parse(map[ModelKeys.createdAt]),
      updatedAt: DateTime.parse(map[ModelKeys.updatedAt]),
    );
  }

  @override
  String toString() =>
      '''
CategoryModel(
  id: $id, 
  title: $title, 
  iconCode: $iconCode,
  createdAt: $createdAt,
  updatedAt: $updatedAt,
)
  ''';

  @override
  List<Object?> get props => [id, title, iconCode, createdAt, updatedAt];
}
