import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/components/nav_bar.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/size_config.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.5,
        // automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              color: backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://image.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg'),
                  ),
                  Text("data")
                ],
              ),
            ),
            Container(
              height: 300,
              color: primaryLightColor,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Language',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16))),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.update),
                    title: Text('Trips',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16))),
                    onTap: () {},
                  ),Divider(),
                  ListTile(
                    leading: Icon(Icons.update),
                    title: Text('Trips',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16))),
                    onTap: () {},
                  ),Divider(),
                  ListTile(
                    leading: Icon(Icons.update),
                    title: Text('Trips',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16))),
                    onTap: () {},
                  ), Divider(),
                  ListTile(
                    leading: Icon(Icons.update),
                    title: Text('Trips',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16))),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
