import 'package:dio/src/response.dart';
import 'package:food_delivery/core/components/data/data_sources/secure_data_base/secure_data_base.dart';
import 'package:food_delivery/core/components/data/data_sources/user_data_source/user_data_source_interface.dart';
import 'package:food_delivery/core/components/data/models/user/user_model.dart';
import 'package:fpdart/src/either.dart';

class UserDataSourceLocal extends UserDataSourceInterface {
  UserDataSourceLocal();
  @override
  Future<Either<Exception, UserModel>> getUserInfo() async {
    try {
      final UserModel? user = await SecureDataBase.getUserInfo();
      if (user != null) {
        return right(user);
      } else {
        return left(Exception("Error happened: User not found in Local DB"));
      }
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, Response>> updateUser(
    Map<String, dynamic> updatedUser,
  ) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
