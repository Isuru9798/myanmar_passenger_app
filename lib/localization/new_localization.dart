import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class NewLocalization {
  final Locale locale;

  NewLocalization(this.locale);

  static NewLocalization of(BuildContext context) {
    return Localizations.of<NewLocalization>(context, NewLocalization)!;
  }

  Map<String, String>? _localizedValues;

  Future load() async {
    String jsonStringValue =
    await rootBundle.loadString("lib/lang/${locale.languageCode}.json");

    Map<String, dynamic> mappingJson = jsonDecode(jsonStringValue);

    _localizedValues =
        mappingJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTranslatedValue(String key) {
    return _localizedValues![key];
  }

  static const LocalizationsDelegate<
      NewLocalization> delegate = _NewLocalizationDelegate();
}

class _NewLocalizationDelegate extends LocalizationsDelegate<NewLocalization> {
  const _NewLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<NewLocalization> load(Locale locale) async {
    NewLocalization localization = new NewLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_NewLocalizationDelegate old) => false;
}
