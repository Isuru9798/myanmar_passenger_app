import 'package:flutter/material.dart';
import '../../components/button_component.dart';
import '../../constants.dart';
import '../splash_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 280.0,
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
                        height: 79.0,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Column(
                      children: [
                        SizedBox(height: 40.0),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                        SizedBox(height: 20.0),
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
                              SizedBox(height: 20.0),
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
                              SizedBox(height: 5.0),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forget Password',
                                ),
                              ),
                              SizedBox(height: 30.0),
                              ButtonComponent(
                                  text: 'Login',
                                  func: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text('Don\'t have an account, sign up '),
                        SizedBox(height: 30.0)
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
