import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen_back.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen_old.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Lato",
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: textColor),
            bodyText2: TextStyle(color: textColor)),
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreenBack(),
      home: LoginScreen(),
      // home: LoginScreenOld(),
    );
  }
}