import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/components/nav_bar.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/main.dart';
import 'package:myanmar_passenger_app/screens/splash_screen.dart';
import 'package:myanmar_passenger_app/util/language.dart';
import 'package:myanmar_passenger_app/util/localization_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  void _changeLanguage(Language lang) async {
    print(lang.languageCode);
    Locale _temp = await setLocale(lang.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.5,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: DropdownButton(
                onChanged: (Language? lng) {
                  _changeLanguage(lng!);
                },
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (lan) => DropdownMenuItem(
                        value: lan,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(lan.flag),
                            Text(lan.name),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
          // automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  // color: primaryColor,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: boxShadowColor1,
                        offset: Offset(0, 15),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                    ),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                height: 200.0,
                                width: double.infinity,
                              )),
                            ))
                        .toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.clear();
                    Navigator.pushNamed(context, SplashScreen.routeName);
                  },
                  child: Text("Logout"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
