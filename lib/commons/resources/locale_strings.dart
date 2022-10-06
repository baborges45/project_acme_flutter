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

  //Cart screen
  String get cart => _checkAndReturnString(
        strings[locale]!.cart,
      );
  String get grandTotal => _checkAndReturnString(
        strings[locale]!.grandTotal,
      );
  String get completeOrder => _checkAndReturnString(
        strings[locale]!.completeOrder,
      );

  //show dialog
  String get textConfirmation => _checkAndReturnString(
        strings[locale]!.textConfirmation,
      );
  String get textOptionConfirmation => _checkAndReturnString(
        strings[locale]!.textOptionConfirmation,
      );
  String get notConfirmation => _checkAndReturnString(
        strings[locale]!.notConfirmation,
      );
  String get yesConfirmation => _checkAndReturnString(
        strings[locale]!.yesConfirmation,
      );

  //order screen
  String get confirmedOrder => _checkAndReturnString(
        strings[locale]!.confirmedOrder,
      );
  String get reversedPix => _checkAndReturnString(
        strings[locale]!.reversedPix,
      );
  String get pixPaymentDue => _checkAndReturnString(
        strings[locale]!.pixPaymentDue,
      );
  String get payment => _checkAndReturnString(
        strings[locale]!.payment,
      );
  String get preparing => _checkAndReturnString(
        strings[locale]!.preparing,
      );
  String get shipping => _checkAndReturnString(
        strings[locale]!.shipping,
      );
  String get delivered => _checkAndReturnString(
        strings[locale]!.delivered,
      );
  String get total => _checkAndReturnString(
        strings[locale]!.total,
      );
  String get qrCodeWithPix => _checkAndReturnString(
        strings[locale]!.qrCodeWithPix,
      );
  String get order => _checkAndReturnString(
        strings[locale]!.order,
      );
}
