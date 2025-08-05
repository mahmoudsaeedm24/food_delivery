import 'package:food_delivery/core/components/base/repo_dependencies.dart';
import 'package:food_delivery/core/components/data/data_sources/user_data_source/user_data_source_local.dart';
import 'package:food_delivery/core/components/data/data_sources/user_data_source/user_data_source_online.dart';
import 'package:fpdart/fpdart.dart';

import '../models/user/user_model.dart';

class UserRepo {
  final RepoDependencies<UserDataSourceOnline, UserDataSourceLocal>
  _repoDependencies;

  UserRepo({
    required RepoDependencies<UserDataSourceOnline, UserDataSourceLocal>
    repoDenpendencies,
  }) : _repoDependencies = repoDenpendencies;

  Future<Either<Exception, UserModel>> getUserInfo() async {
    // return (await _networkChecker.isConnected())
    //     ? await _getCategoriesOnline()
    //     : await _getCategoriesLocal();

    if (await _repoDependencies.networkChecker.isConnected()) {
      final userJson = await _repoDependencies.online.getUserInfo();

      return userJson.map((userRes) {
        final userJson = Map<String, dynamic>.from(userRes.data);
        return UserModel.fromJson(userJson);
      });
    } else {
      return await _repoDependencies.local.getUserInfo();
    }
  }
}
