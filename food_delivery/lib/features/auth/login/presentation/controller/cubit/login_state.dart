part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginStateInitial extends LoginState {}

final class LoginStateLoading extends LoginState {}

final class LoginStateSuccess extends LoginState {}

final class LoginStateFailed extends LoginState {
  final Exception e;

  LoginStateFailed({required this.e});
}
