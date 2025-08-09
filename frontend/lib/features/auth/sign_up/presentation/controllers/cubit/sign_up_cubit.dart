import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/core/components/data/models/user/user_model.dart';
import 'package:frontend/features/auth/data/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._repo) : super(SignUpInitial());
  final AuthRepo _repo;
  Future<void> signup(UserModel user) async {
    emit(SignUpLoading());
    final res = await _repo.signup(user);
    res.fold((e) => emit(SignUpFailed(e: e)), (r) => emit(SignUpSuccess()));
  }
}
