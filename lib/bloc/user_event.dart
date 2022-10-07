part of 'user_bloc.dart';

@immutable

abstract class UserEvent{}
  
class ActivateUser extends UserEvent{
  final User user;
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent{
  final int age;

  ChangeUserAge(this.age);
}

class ChangeUserProfesion extends UserEvent{
  final List<String> profesiones;

  ChangeUserProfesion(this.profesiones);

}

class DeleteUser extends UserEvent{

}


