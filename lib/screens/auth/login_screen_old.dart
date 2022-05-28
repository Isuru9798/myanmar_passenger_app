import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/constants.dart';

class LoginScreenOld extends StatefulWidget {
  const LoginScreenOld({Key? key}) : super(key: key);

  @override
  State<LoginScreenOld> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenOld> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? loginEmail;
  String? loginPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: globalFormKey,
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Image(
                    alignment: Alignment.center,
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage("assets/images/logo/logo.jpg"),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Passenger Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          // controller: loginEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(fontSize: 14),
                            hintStyle:
                                TextStyle(color: textColor, fontSize: 10.0),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 14),
                            hintStyle:
                                TextStyle(color: textColor, fontSize: 10.0),
                          ),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text('Login',
                                  style: TextStyle(fontSize: 18.0)),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                // side: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Don\'t have an account, sign up'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



