import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/auth/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  // LoginScreen.routeName: (context) => LoginScreen(),
};
