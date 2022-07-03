import 'package:flutter/material.dart';
import 'package:myanmar_passenger_app/localization/new_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) {
  return NewLocalization.of(context).getTranslatedValue(key).toString();
}

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  await _pref.setString("language_code", languageCode);
  return _locale(languageCode);
}

Locale _locale(String langCode) {
  Locale _temp;
  switch (langCode) {
    case 'en':
      _temp = Locale(langCode, 'US');
      break;
    case 'fr':
      _temp = Locale(langCode);
      break;
    default:
      _temp = Locale(langCode, 'US');
  }

  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  String langCode = _pref.getString("language_code") ?? 'en';
  return _locale(langCode);
}
