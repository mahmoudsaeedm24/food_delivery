import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/data/auth_repo.dart';
import 'package:frontend/features/auth/login/domain/user_entity_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginStateInitial());
  final AuthRepo _repo;

  Future<void> login(UserEntityLogin user) async {
    emit(LoginStateLoading());

    final res = await (await _repo.login(user)).run();
    res.fold((exception) {
      emit(LoginStateFailed(e: exception));
    }, (r) => emit(LoginStateSuccess()));
  }
}
