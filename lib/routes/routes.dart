import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/screens/auth/register_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/auth/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};
