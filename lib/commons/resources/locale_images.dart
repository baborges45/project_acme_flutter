import 'dart:ui';

import 'app_images.dart';
import 'app_images_pt_br.dart';

class LocaleImages implements AppImages {
  Locale locale = const Locale('pt', 'BR');

  final Map<Locale, AppImages> strings = {
    const Locale('pt', 'BR'): AppImagesPtBr()
  };

  String _checkAndReturnString(String? value) {
    if (value == null) {
      throw ArgumentError('No translation found');
    }

    return value;
  }

  @override
  String get fruitApple => _checkAndReturnString(
        strings[locale]!.fruitApple,
      );
  @override
  String get fruitGrape => _checkAndReturnString(
        strings[locale]!.fruitGrape,
      );
  @override
  String get fruitGuava => _checkAndReturnString(
        strings[locale]!.fruitGuava,
      );
  @override
  String get fruitKiwi => _checkAndReturnString(
        strings[locale]!.fruitKiwi,
      );
  @override
  String get fruitMango => _checkAndReturnString(
        strings[locale]!.fruitMango,
      );
  @override
  String get fruitPapaya => _checkAndReturnString(
        strings[locale]!.fruitPapaya,
      );
}
