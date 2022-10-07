import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user))); 
    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      //si no tiene el estado, no realiza nada
      if (!state.ExistUser) return;
      // si el usuario existe envia el copywith con el dato que tiene
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<ChangeUserProfesion>((event, emit) {
      if (!state.ExistUser) return;
      emit(UserSetState(state.user!.copyWith(profesiones: event.profesiones)));
    });
  }
}
