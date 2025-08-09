import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/features/auth/data/data_source/auth_data_source.dart';
import 'package:frontend/features/auth/login/domain/user_entity_login.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/components/data/data_sources/secure_data_base/secure_data_base.dart';

class AuthRepo {
  final AuthDataSource _online;

  AuthRepo({required AuthDataSource online}) : _online = online;

  Future<TaskEither<Exception, Unit>> login(UserEntityLogin user) async {
    final either = await _online.login(user.toJson());
    return either.bindFuture((res) async {
      final tokenHeader = res.headers.value('authorization');
      return await saveToken(tokenHeader, res);
    });
    // return either.flatMap((res) {});
  }

  Future<Either<Exception, Unit>> saveToken(
    String? tokenHeader,
    Response<dynamic> res,
  ) async {
    if (tokenHeader != null && tokenHeader.startsWith('Bearer ')) {
      final token = tokenHeader.split(' ')[1];
      log('✅ Token saved: $token');
      final userJson = Map<String, dynamic>.from(res.data);
      final UserModel userModel = UserModel.fromJson(userJson);
      await SecureDataBase.storeToken(token, userModel.toStringJson());
      // await SecureDataBase.storeUser(userModel.toStringJson());
      return right(unit);
    } else {
      return left(Exception('Token not found in response headers'));
    }
  }

  Future<Either<Exception, Unit>> signup(UserModel user) async {
    return await _online.signup(user.toJson());
  }
}
