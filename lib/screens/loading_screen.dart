import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/constants.dart';

class LodingScreen extends StatelessWidget {
  const LodingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
