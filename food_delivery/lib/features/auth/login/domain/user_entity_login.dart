// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../../../core/utils/keys.dart';

class UserEntityLogin extends Equatable{
  final String email;
  final String password;
  const UserEntityLogin({required this.email, required this.password});

  UserEntityLogin copyWith({String? email, String? password}) {
    return UserEntityLogin(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ModelKeys.email: email,
      ModelKeys.password: password,
    };
  }

  factory UserEntityLogin.fromJson(Map<String, dynamic> map) {
    return UserEntityLogin(
      email: map[ModelKeys.email] as String,
      password: map[ModelKeys.password] as String,
    );
  }

  @override
  String toString() => 'UserEntityLogin(email: $email, password: $password)';

  @override
  List<Object?> get props => [email, password];
}
