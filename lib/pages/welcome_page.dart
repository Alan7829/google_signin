// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/bloc/login_bloc.dart';
import 'package:google_signin/tools/shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final _prefs = PreferenciasUsuario.instance;
  final log = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final name = _prefs.nombre;
    final foto = _prefs.foto;
    final email = _prefs.email;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              log.signOut();
              Navigator.pop(context);
            },
            child: Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                foto,
                scale: 1.5,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Bienvenido $name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Haz iniciado con \n$email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
