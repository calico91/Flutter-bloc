part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool ExistUser;
  final User? user;

  const UserState({this.ExistUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(ExistUser: false, user: null);
}

class UserSetState extends UserState {
  final User newUser;
  const UserSetState(this.newUser) : super(ExistUser: true, user: newUser);
}
