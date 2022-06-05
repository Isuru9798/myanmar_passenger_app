import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/components/button_component.dart';
import 'package:myanmar_passenger_app/constants.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen.dart';
import 'package:myanmar_passenger_app/screens/splash_screen.dart';
import 'package:myanmar_passenger_app/size_config.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = 'register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getProportionateScreenHeight(280.0),
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
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(79.0),
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(320.0),
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(40.0)),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                        SizedBox(height: getProportionateScreenHeight(20.0)),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your email address";
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(20.0)),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value.trim().length < 8) {
                                    return 'Password must be at least 8 characters in length';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(5.0)),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forget Password',
                                ),
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(50.0)),
                              ButtonComponent(
                                  colorCode: primaryColor,
                                  text: 'Login',
                                  func: () {

                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                      Navigator.of(context)
                                          .pushNamed(SplashScreen.routeName);
                                    }
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30.0)),
                        Text('Don\'t have an account, sign up '),
                        SizedBox(height: getProportionateScreenHeight(30.0))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: Text(''),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: backgroundColor),
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(SplashScreen.routeName)},
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
