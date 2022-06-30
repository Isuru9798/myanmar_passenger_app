import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/config.dart';
import 'package:myanmar_passenger_app/models/login_model/login_model.dart';
import 'package:myanmar_passenger_app/models/user_model/user_model.dart';
import 'package:myanmar_passenger_app/screens/auth/login_screen.dart';
import 'package:myanmar_passenger_app/screens/home/home_screen.dart';
import 'package:myanmar_passenger_app/util/error_handler.dart';
import 'package:myanmar_passenger_app/util/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String _token = '';
  String _uId = '';

  bool get isAuth {
    return token != null && token != "";
  }

  String? get token {
    if (_token != null && _token != "") {
      return _token;
    }
    return null;
  }

  String get userId {
    return _uId;
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }

    _token = prefs.getString('token').toString();
    _uId = prefs.getString('userId').toString();

    notifyListeners();
    return true;
  }

  Future<void> signUpUser({
    required BuildContext context,
    required UserModel user,
    required LoginModel login,
  }) async {
    try {
      final _data = <String, dynamic>{};
      _data["user"] = user;
      _data["login"] = login;

      final http.Response res = await http.post(
          Uri.parse('${Config.BACKEND_URL}/authentication/register'),
          body: jsonEncode(_data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      ErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, jsonDecode(res.body)['message']);
          // Navigator.of(context).pushNamed(OtpScreen.routeName);
        },
      );
      if (jsonDecode(res.body)['status']) {
        Navigator.of(context).pushNamed(LoginScreen.routeName);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Config.BACKEND_URL}/authentication/login'),
        body: jsonEncode({
          "login_email": email,
          "login_password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      ErrorHandler(
        response: res,
        context: context,
        onSuccess: () async {
          if (jsonDecode(res.body)["status"]) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            //set token and user ids

            _token = jsonDecode(res.body)["token"];
            _uId = jsonDecode(res.body)["data"]["_id"];
            await prefs.setString("token", _token);
            await prefs.setString("user_id", _uId);
            notifyListeners();

            Navigator.of(context).pushNamedAndRemoveUntil(
              HomeScreen.routeName,
              (Route<dynamic> route) => false,
            );
          }
          showSnackBar(context, jsonDecode(res.body)['message']);
          // Navigator.of(context).pushNamed(LoginScreen.routeName);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
