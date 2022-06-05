import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import './XDLogin.dart';
import 'package:adobe_xd/page_link.dart';

// import './XDRegister.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myanmar_passenger_app/components/button_component.dart';
import 'package:myanmar_passenger_app/screens/auth/register_screen.dart';
import '../constants.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext, Widget) => Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Pinned.fromPins(
              Pin(start: 0.w, end: 0.w),
              Pin(size: 406.h, start: 0.w),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.r),
                    bottomLeft: Radius.circular(50.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryLightColor,
                      offset: Offset(0, 15),
                      blurRadius: 30.r,
                    ),
                  ],
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 310.r, start: -115.r),
              Pin(size: 310.r, start: -173.r),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffbabdbf),
                  borderRadius:
                  BorderRadius.all(Radius.elliptical(9999.r, 9999.r)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 310.r, end: -185.r),
              Pin(size: 310.r, middle: (0.4004).r),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffbfa780),
                  borderRadius:
                  BorderRadius.all(Radius.elliptical(9999.r, 9999.r)),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: (526.7).w, end: (-263.3).w),
              Pin(size: 300.w, middle: (0.6016).h),
              child: Image.asset("assets/images/car_1.png"),
            ),
            Align(
              alignment: Alignment((-0.002).w, (-0.58).h),
              child: SizedBox(
                  width: 90.w,
                  // height: 79.h,
                  child: Image.asset('assets/images/logo.png')),
            ),
            Pinned.fromPins(
              Pin(start: 31.w, end: 30.w),
              Pin(size: 45.w, end: 95.w),
              child: ButtonComponent(
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
            ),
            Pinned.fromPins(
              Pin(start: 30.w, end: 30.w),
              Pin(size: 45.w, end: 30.w),
              child: ButtonComponent(
                colorCode: primaryColor,
                text: 'Register',
                func: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
