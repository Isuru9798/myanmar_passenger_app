import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myanmar_passenger_app/localization/new_localization.dart';
import 'package:myanmar_passenger_app/providers/auth_provider.dart';
import 'package:myanmar_passenger_app/screens/home/home_screen.dart';
import 'package:myanmar_passenger_app/screens/loading_screen.dart';
import 'package:myanmar_passenger_app/services/authentication/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './constants.dart';
import 'routes/routes.dart';
import './screens/splash_screen.dart';
import './util/localization_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {
          setState(() {
            _locale = locale;
          })
        });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AuthProvider()),
        ],
        child: Consumer<AuthProvider>(
          builder: (context, auth, _) => MaterialApp(
            locale: _locale,
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
            supportedLocales: [
              Locale('en', 'US'), // English, no country code
              Locale('fr'),
            ],
            localizationsDelegates: [
              NewLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale?.languageCode &&
                    locale.countryCode == deviceLocale?.countryCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            home: auth.isAuth
                ? HomeScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? LodingScreen()
                            : SplashScreen(),
                  ),
            routes: routes,
          ),
        ),
      );
    }
  }
}

//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(value: AuthProvider()),
//       ],
//       child: ScreenUtilInit(
//         builder: (BuildContext, Widget) => Consumer<AuthProvider>(
//           builder: (context, auth, _) => MaterialApp(
//             title: 'Flutter Demo',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               scaffoldBackgroundColor: Colors.white,
//               fontFamily: "Lato",
//               textTheme: const TextTheme(
//                   bodyText1: TextStyle(color: textColor),
//                   bodyText2: TextStyle(color: textColor)),
//               primarySwatch: Colors.blue,
//             ),
//             // home: SplashScreen(),
//             // home: XDSplashScreen(),
//             home: auth.isAuth
//                 ? HomeScreen()
//                 : FutureBuilder(
//                     future: auth.tryAutoLogin(),
//                     builder: (context, authResultSnapshot) => SplashScreen(),
//                   ),
//
//             routes: routes,
//           ),
//         ),
//         designSize: const Size(375, 812),
//       ),
//     );
//   }
// }
//
