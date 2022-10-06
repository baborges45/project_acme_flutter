import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_acme/commons/platform/platform_app.dart';
import 'package:flutter_project_acme/commons/resources/locale_images.dart';
import 'package:flutter_project_acme/commons/resources/locale_strings.dart';
import 'package:flutter_project_acme/commons/resources/localizations/br/cuppertino_localizations.dart';
import 'package:flutter_project_acme/commons/resources/translation.dart';
import 'package:flutter_project_acme/src/models/item_model.dart';
import 'package:flutter_project_acme/src/pages/base/base_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<String> items = [
    'Armário',
    'Navio',
    'Mala',
    'Base',
    'Hidroavião',
    'Revista',
    'Carretel',
    'Minissaia',
    'Tamborim',
    'Andador',
    'Geladeira',
    'Estátua',
    'Rolo',
  ];

  ItemModel grape = ItemModel(
    imgUrl: LocaleImages().fruitGrape,
    itemName: items,
    price: 7.4,
    unit: 'kg',
    description: 'A melhor uva da região',
  );

  testWidgets('teste find all widgets product screen', (tester) async {
    await _createWidget(
      tester,
      itemModel: grape,
    );

    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);

    final image = tester.widget<Image>(find.byType(Image));
    expect(
      (image.image as AssetImage).assetName,
      grape.imgUrl,
    );

    expect(find.text(grape.description!), findsOneWidget);

    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

    expect(find.text(LocaleStrings().addToCart), findsOneWidget);
  });
}

Future<void> _createWidget(
  WidgetTester tester, {
  ItemModel? itemModel,
}) async {
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
