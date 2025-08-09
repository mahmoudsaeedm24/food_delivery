import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/repos/user_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../data/models/user/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._repo) : super(UserStateInitial(UserModel.mock())) {
    getUserInfo();
  }
  final UserRepo _repo;

  Future<void> getUserInfo() async {
    Either<Exception, UserModel> either = await _repo.getUserInfo();
    either.fold(
      (e) => emit(UserStateFailed(state.user, e)),
      (userModel) => emit(UserStateLoaded(userModel)),
    );
  }
}
