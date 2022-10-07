import 'package:estados/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';


class Pagina1Page extends StatelessWidget {
  
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete) ,
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            },) 
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>( //condiciona el widget dependiento el estado
        builder: (_, state) {
          return state.ExistUser
          ? InformacionUsuario(user: state.user!)
          : const Center(
            child: Text('no hay usuario seleccionado'),
          );
        },
      ),
     floatingActionButton: FloatingActionButton(
       child: const Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  
  final User user;

  const InformacionUsuario({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
    
            Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
            Divider(),
    
            ListTile( title: Text('Nombre:${user.nombre}') ),
            ListTile( title: Text('Edad:${user.edad} ') ),
    
            Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
            Divider(),
    
            ...user.profesiones.map((prof)=>ListTile( title: Text(prof) ),),
            // ListView.builder(
            //   itemCount: user.profesiones.length,
            //   itemBuilder:(_, i) {
            //     return Text('${user.profesiones[i]}');
            //   },)
          ],
        ),
      ),
    );
  }

}