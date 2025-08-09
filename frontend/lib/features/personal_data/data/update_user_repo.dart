import 'package:frontend/core/components/data/data_sources/user_data_source/user_data_source_online.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/components/data/models/user/user_model.dart';

class UpdateUserRepo {
  final UserDataSourceOnline _online;

  UpdateUserRepo({required UserDataSourceOnline online}) : _online = online;

  Future<Either<Exception, UserModel>> updateUser({
    required UserModel userModel,
  }) async {
    final response = await _online.updateUser(userModel.toJson());

    return response.map((res) {
      final userJson = Map<String, dynamic>.from(res.data);

      return UserModel.fromJson(userJson);
    });
  }
}
