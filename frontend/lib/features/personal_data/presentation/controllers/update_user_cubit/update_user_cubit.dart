import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/features/personal_data/data/update_user_repo.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this._repo) : super(UpdateUserInitial());
  final UpdateUserRepo _repo;

  Future<void> updateUser({required UserModel userModel}) async {
    emit(UpdateUserLoading());
    final either = await _repo.updateUser(userModel: userModel);

    either.fold(
      (e) => emit(UpdateUserFailed(e: e)),
      (user) => emit(UpdateUserUpdated(user: user)),
    );
  }
}
