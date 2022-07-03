import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/components/button_component.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/screens/home/home_screen.dart';
import 'package:myanmar_passenger_app/screens/home/settings/language/language_screen.dart';
import 'package:myanmar_passenger_app/screens/home/settings/settings_screen.dart';
import 'package:myanmar_passenger_app/screens/splash_screen.dart';
import 'package:myanmar_passenger_app/size_config.dart';
import 'package:myanmar_passenger_app/util/localization_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isLoading = false;

  void _logout() async {
    setState(() {
      isLoading = true;
    });
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('user_id');

    await Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
    Navigator.pushNamed(context, SplashScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              accountName: Text('Isuru'),
              accountEmail: Text('myemail@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://image.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(getTranslated(context, 'home'),
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeScreen.routeName,
                  (route) => false,
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LanguageScreen.routeName,
                  (route) => false,
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Trips',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text('Wallet',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.backpack),
              title: Text('Package',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.water_drop),
              title: Text('Water Delivery',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Rent',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Update Profile',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            ButtonComponent(
              text: "Logout",
              func: _logout,
              isLoading: isLoading,
              colorCode: secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}
