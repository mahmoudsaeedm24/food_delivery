part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState(this.user);
  final UserModel user;
  @override
  List<Object> get props => [];
}

final class UserStateInitial extends UserState {
  const UserStateInitial(super.user);
}

final class UserStateLoaded extends UserState {
  const UserStateLoaded(super.user);
}

final class UserStateFailed extends UserState {
  const UserStateFailed(super.user, this.e);
  final Exception e;
  @override
  List<Object> get props => [...super.props, e];
}

final class UserStateUpdated extends UserState {
  const UserStateUpdated(super.user);
}
