import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './constants.dart';
import 'routes/routes.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext, Widget) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Lato",
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: textColor),
              bodyText2: TextStyle(color: textColor)),
          primarySwatch: Colors.blue,
        ),
        // home: SplashScreen(),
        // home: XDSplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
      designSize: const Size(375, 812),
    );
  }
}
