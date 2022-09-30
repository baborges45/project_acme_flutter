import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PtBrCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const PtBrCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode == 'pt' && locale.countryCode == 'BR';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      PtBrCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(PtBrCupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(en_US)';
}

class PtBrCupertinoLocalizations implements CupertinoLocalizations {
  /// Constructs an object that defines the cupertino widgets' localized strings
  /// for US English (only).
  ///
  /// [LocalizationsDelegate] implementations typically call the static [load]
  /// function, rather than constructing this class directly.
  const PtBrCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sab',
    'Dom',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez',
  ];

  static const List<String> _months = <String>[
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => "${hour.toString()} o'clock";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) =>
      (minute == 1) ? '1 minuto' : '${minute.toString()} minutos';

  @override
  String datePickerMediumDate(DateTime date) =>
      '${_shortWeekdays[date.weekday - DateTime.monday]} '
      '${_shortMonths[date.month - DateTime.january]} '
      '${date.day.toString().padRight(2)}';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel => 'Alerta';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'hora' : 'horas';

  @override
  String timerPickerMinuteLabel(int minute) => 'min';

  @override
  String timerPickerSecondLabel(int second) => 'seg';

  @override
  String get cutButtonLabel => 'Recortar';

  @override
  String get copyButtonLabel => 'Copiar';

  @override
  String get pasteButtonLabel => 'Colar';

  @override
  String get selectAllButtonLabel => 'Selecionar Tudo';

  @override
  String get todayLabel => 'Hoje';

  @override
  String get modalBarrierDismissLabel => 'Dispensar';

  @override
  String tabSemanticsLabel({int? tabIndex, int? tabCount}) {
    assert(tabIndex! >= 1);
    assert(tabCount! >= 1);
    return 'Tab $tabIndex de $tabCount';
  }

  @override
  String get searchTextFieldPlaceholderLabel => 'Pesquisar';

  @override
  List<String> get timerPickerHourLabels => const <String>['hora', 'horas'];

  @override
  List<String> get timerPickerMinuteLabels => const <String>['min.'];

  @override
  List<String> get timerPickerSecondLabels => const <String>['seg.'];

  /// Creates an object that provides US English resource values for the
  /// cupertino library widgets.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  static Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture(const PtBrCupertinoLocalizations());

  /// A [LocalizationsDelegate] that uses [PtBrCupertinoLocalizations.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      PtBrCupertinoLocalizationsDelegate();
}
