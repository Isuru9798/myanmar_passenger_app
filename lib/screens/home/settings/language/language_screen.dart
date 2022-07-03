import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/screens/home/home_screen.dart';

class LanguageScreen extends StatelessWidget {
  static String routeName = "/language";

  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text(''),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: backgroundColor),
                onPressed: () =>
                    {Navigator.of(context).pushNamed(HomeScreen.routeName)},
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
