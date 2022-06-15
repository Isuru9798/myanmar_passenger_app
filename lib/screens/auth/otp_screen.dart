import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


import '../../components/button_component.dart';
import '../../constants.dart';
import './login_screen.dart';
import '../../size_config.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = 'otp';

  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      'OTP Verfication',
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
                      child: Pinput(
                          onCompleted: (pin) => {print(pin)},
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsRetrieverApi),
                    ),
                    SizedBox(height: getProportionateScreenHeight(30.0)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Resend Code',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(30.0)),
                    ButtonComponent(
                      text: 'Verify',
                      func: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      colorCode: primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
