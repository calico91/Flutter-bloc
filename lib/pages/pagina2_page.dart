import 'package:estados/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final newUser =
        User(nombre: ' Isma', edad: 5, profesiones: ['DJ', 'Bebe Comelon']);

    final UserEvent userEvent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          botonPagina2(
              userBloc: userBloc,
              newUser: newUser,
              textoBoton: 'Establecer Usuario'),
          botonPagina2(
              userBloc: userBloc, newUser: newUser, textoBoton: 'Cambiar Edad'),
          botonPagina2(
              userBloc: userBloc,
              newUser: newUser,
              textoBoton: 'Añadir Profesion'),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAge(25));
              }),
          MaterialButton(
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                newUser.profesiones.add('lindo');
                userBloc.add(ChangeUserProfesion(newUser.profesiones));
              }),
        ],
      )),
    );
  }
}

class botonPagina2 extends StatelessWidget {
  final UserBloc userBloc;
  final User? newUser;
  final String textoBoton;

  const botonPagina2({
    Key? key,
    required this.userBloc,
    this.newUser,
    required this.textoBoton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(textoBoton,
                style: TextStyle(
                  color: Colors.white,
                )),
            if (textoBoton == 'Establecer Usuario')
              Icon(Icons.verified_user, color: Colors.white),
            if (textoBoton == 'Cambiar Edad')
              Icon(
                Icons.emoji_people_sharp,
                color: Colors.white,
              ),
            if (textoBoton == 'Añadir Profesion')
              Icon(
                Icons.work_history,
                color: Colors.white,
              ),
          ],
        ),
        color: Colors.blue,
        onPressed: () {
          switch (textoBoton) {
            case 'Establecer Usuario':
              userBloc.add(ActivateUser(newUser!));
              break;
            case 'Cambiar Edad':
              userBloc.add(ChangeUserAge(25));
              break;
            default:
              newUser!.profesiones.add('Mueco');
              userBloc.add(ChangeUserProfesion(newUser!.profesiones));
          }
        });
  }
}
