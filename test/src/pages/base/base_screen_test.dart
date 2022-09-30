import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_acme/commons/platform/platform_app.dart';
import 'package:flutter_project_acme/commons/resources/localizations/br/cuppertino_localizations.dart';
import 'package:flutter_project_acme/commons/resources/translation.dart';
import 'package:flutter_project_acme/src/pages/base/base_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('base screen ...', (tester) async {
    await _createWidget(tester);

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(
        find.byIcon(Icons.home_outlined, skipOffstage: true), findsOneWidget);
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
      home: BaseScreen(),
    ),
  );

  await tester.pump();
}
