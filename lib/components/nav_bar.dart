import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/screens/settings/settings_screen.dart';
import 'package:myanmar_passenger_app/size_config.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

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
              leading: Icon(Icons.language),
              title: Text('Language',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16))),
              onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
