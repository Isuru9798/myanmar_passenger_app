import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

// import './XDLogin.dart';
import 'package:adobe_xd/page_link.dart';

// import './XDRegister.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myanmar_passenger_app/components/button_component.dart';
import '../constants.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen.dart';

class SplashScreen2 extends StatelessWidget {
  static String routeName = '/splash';

  SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280.0,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: primaryLightColor,
                      //     offset: Offset(0.0, 15.0),
                      //     blurRadius: 30.0,
                      //   ),
                      // ],
                    ),
                  ),
                  Positioned(
                    left: -50,
                    top: -120,
                    child: SizedBox(
                      width: 230.0,
                      height: 220.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryLightColor,
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 220.0,
              ),
              SizedBox(
                width: 350.0,
                child: Column(
                  children: [
                    ButtonComponent(
                      colorCode: primaryColor,
                      text: 'Login',
                      func: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ButtonComponent(
                      colorCode: primaryLightColor,
                      text: 'Register',
                      func: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // ButtonComponent(
              //   colorCode: primaryColor,
              //   text: 'Login',
              //   func: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (_) {
              //           return LoginScreen();
              //         },
              //       ),
              //     );
              //   },
              // ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
