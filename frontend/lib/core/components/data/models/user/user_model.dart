// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:frontend/core/constants.dart';
import 'package:frontend/core/utils/keys.dart';

class UserModel extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String? phone;
  final String? address;
  final String? houseNo;
  final String? city;
  final String? createdAt;
  final String img;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.phone,
    this.address,
    this.houseNo,
    this.city,
    this.createdAt,
    this.img = Constants.ignoreImage,
  });

  factory UserModel.mock() {
    return UserModel(
      name: "jemmy ev",
      email: "example.example.com",
      password: "123456",
      address: "Egypt",
      city: "cairo",
      createdAt: "${DateTime.timestamp()}",
      houseNo: "13",
      id: "1",
      phone: "01552483586",
    );
  }
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? address,
    String? houseNo,
    String? city,
    String? createdAt,
    String? img,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      houseNo: houseNo ?? this.houseNo,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ModelKeys.id: id,
      ModelKeys.name: name,
      ModelKeys.email: email,
      ModelKeys.password: password,
      ModelKeys.phone: phone,
      ModelKeys.address: address,
      ModelKeys.houseNo: houseNo,
      ModelKeys.city: city,
      ModelKeys.createdAt: createdAt,
      ModelKeys.img: img,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map[ModelKeys.id],
      name: map[ModelKeys.name],
      email: map[ModelKeys.email],
      password: map[ModelKeys.password],
      phone: map[ModelKeys.phone],
      address: map[ModelKeys.address],
      houseNo: map[ModelKeys.houseNo],
      city: map[ModelKeys.city],
      createdAt: map[ModelKeys.createdAt],
      img: map[ModelKeys.img]??Constants.ignoreImage,
    );
  }

  factory UserModel.fromString(String jsonString) {
    return UserModel.fromJson(json.decode(jsonString));
  }

  String toStringJson() {
    return json.encode(toJson());
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, phone: $phone, address: $address, houseNo: $houseNo, city: $city, createdAt: $createdAt, img: $img)';
  }

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    password,
    phone,
    address,
    houseNo,
    city,
    createdAt,
    img,
  ];
}
