import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/components/nav_bar.dart';
import 'package:myanmar_passenger_app/constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        // automaticallyImplyLeading: false,
      ),
      body: SafeArea(child: Container()),
    );
  }
}
