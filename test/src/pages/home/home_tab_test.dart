import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_acme/commons/platform/platform_app.dart';
import 'package:flutter_project_acme/commons/resources/locale_strings.dart';
import 'package:flutter_project_acme/commons/resources/localizations/br/cuppertino_localizations.dart';
import 'package:flutter_project_acme/commons/resources/translation.dart';
import 'package:flutter_project_acme/src/pages/home/home_tab.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('teste find all widgets home tab', (tester) async {
    await _createWidget(tester);

    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);

    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

    expect(find.byType(Badge), findsOneWidget);

    expect(
      find.text(
          '${LocaleStrings().nameApp1}'
          '${LocaleStrings().nameApp2}',
          findRichText: true),
      findsOneWidget,
    );
  });
}

Future<void> _createWidget(
  WidgetTester tester,
) async {
  await tester.pumpWidget(
    PlatformApp(
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        PtBrCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      home: HomeTab(),
    ),
  );

  await tester.pump();
}
