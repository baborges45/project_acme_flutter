import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'commons/resources/localizations/br/cuppertino_localizations.dart';
import 'commons/resources/translation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/pages/auth/components/sign_in_screen.dart';
import 'src/pages/base/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        PtBrCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: BaseScreen(),
    );
  }
}
