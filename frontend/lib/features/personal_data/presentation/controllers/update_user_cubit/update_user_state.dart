part of 'update_user_cubit.dart';

sealed class UpdateUserState extends Equatable {
  const UpdateUserState();

  @override
  List<Object> get props => [];
}

final class UpdateUserInitial extends UpdateUserState {}

final class UpdateUserLoading extends UpdateUserState {}

final class UpdateUserUpdated extends UpdateUserState {
  final UserModel user;

  const UpdateUserUpdated({required this.user});

  @override
  List<Object> get props => [...super.props, user];
}

final class UpdateUserFailed extends UpdateUserState {
  final Exception e;

  const UpdateUserFailed({required this.e});
  @override
  List<Object> get props => [...super.props, e];
}
