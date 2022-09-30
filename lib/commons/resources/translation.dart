import 'dart:async';

import 'package:flutter/widgets.dart';

import 'locale_strings.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Translation> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'pt';

  @override
  Future<Translation> load(Locale locale) => Translation.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Translation> old) => false;
}

class Translation with LocaleStrings {
  static Future<Translation> load(Locale locale) =>
      Future.value(Translation()..locale = locale);

  static Translation of(BuildContext context) =>
      Localizations.of(context, Translation);
}
