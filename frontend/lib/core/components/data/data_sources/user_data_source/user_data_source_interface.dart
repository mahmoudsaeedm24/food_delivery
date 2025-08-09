import 'package:fpdart/fpdart.dart';

abstract class UserDataSourceInterface {
  Future<Either<Exception, dynamic>> getUserInfo();

  Future<Either<Exception, dynamic>> updateUser(Map<String, dynamic> updatedUser,);
}
