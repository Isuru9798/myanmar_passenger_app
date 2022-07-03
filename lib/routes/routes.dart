
import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/screens/home/home_screen.dart';
import 'package:myanmar_passenger_app/screens/home/settings/language/language_screen.dart';
import 'package:myanmar_passenger_app/screens/home/settings/settings_screen.dart';

import '../screens/auth/otp_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/auth/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // auth routes
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),

  // home routes
  HomeScreen.routeName: (context) => HomeScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  LanguageScreen.routeName: (context) => LanguageScreen(),
};
