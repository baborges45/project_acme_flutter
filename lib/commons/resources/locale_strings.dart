// ignore_for_file: lines_longer_than_80_chars

import 'dart:ui';

import 'app_strings.dart';
import 'app_strings_pt_br.dart';

class LocaleStrings implements AppStrings {
  Locale locale = const Locale('pt', 'BR');

  final Map<Locale, AppStrings> strings = {
    const Locale('pt', 'BR'): AppStringsPtBR()
  };

  String _checkAndReturnString(String value) {
    // ignore: unnecessary_null_comparison
    if (value == null) {
      throw ArgumentError('No translation found');
    }

    return value;
  }

  // LoginPage
  @override
  String get loginTitle01 => _checkAndReturnString(
        strings[locale]!.loginTitle01,
      );
  @override
  String get loginTitle02 => _checkAndReturnString(
        strings[locale]!.loginTitle02,
      );
  @override
  String get loginCreateAccount => _checkAndReturnString(
        strings[locale]!.loginCreateAccount,
      );

  // Animatedtext
  @override
  String get animatedText01 => _checkAndReturnString(
        strings[locale]!.animatedText01,
      );
  @override
  String get animatedText02 => _checkAndReturnString(
        strings[locale]!.animatedText02,
      );
  @override
  String get animatedText03 => _checkAndReturnString(
        strings[locale]!.animatedText03,
      );
  @override
  String get animatedText04 => _checkAndReturnString(
        strings[locale]!.animatedText04,
      );
  @override
  String get animatedText05 => _checkAndReturnString(
        strings[locale]!.animatedText05,
      );

  // Base Screen
  @override
  String get bottomHome => _checkAndReturnString(
        strings[locale]!.bottomHome,
      );
  @override
  String get bottomShoppingCart => _checkAndReturnString(
        strings[locale]!.bottomShoppingCart,
      );
  @override
  String get bottomOrderList => _checkAndReturnString(
        strings[locale]!.bottomOrderList,
      );
  @override
  String get bottomProfile => _checkAndReturnString(
        strings[locale]!.bottomProfile,
      );

  //Home Tab
  @override
  String get nameApp1 => _checkAndReturnString(
        strings[locale]!.nameApp1,
      );
  @override
  String get nameApp2 => _checkAndReturnString(
        strings[locale]!.nameApp2,
      );
  @override
  String get search => _checkAndReturnString(
        strings[locale]!.search,
      );

  //Product Screen
  @override
  String get addToCart => _checkAndReturnString(
        strings[locale]!.addToCart,
      );
}
