// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/pages/login_page.dart';
import 'package:google_signin/pages/welcome_page.dart';
import 'package:google_signin/tools/shared_preferences.dart';

void main(List<String> args) async {
  final prefs = PreferenciasUsuario.instance;

  runApp(MyApp());
  await Firebase.initializeApp();
  await prefs.initPrefs();
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      title: "Google SignIn",
      routes: {"login": (_) => LoginPage(), "welcome": (_) => WelcomePage()},
    );
  }
}
