part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailed extends SignUpState {
  final Exception e;

  const SignUpFailed({required this.e});
  
  @override
  List<Object> get props => [e];
}
