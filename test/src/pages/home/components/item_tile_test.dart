import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_acme/commons/platform/platform_app.dart';
import 'package:flutter_project_acme/commons/resources/locale_images.dart';
import 'package:flutter_project_acme/commons/resources/localizations/br/cuppertino_localizations.dart';
import 'package:flutter_project_acme/commons/resources/translation.dart';
import 'package:flutter_project_acme/src/models/item_model.dart';
import 'package:flutter_project_acme/src/pages/home/components/item_tile.dart';
import 'package:flutter_project_acme/src/service/utils_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ItemModel grape = ItemModel(
    imgUrl: LocaleImages().fruitGrape,
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg',
    description: 'A melhor uva da região',
  );

  final UtilsServices utilsServices = UtilsServices();

  testWidgets('test find all widgets item tile', (tester) async {
    await _createWidget(
      tester,
      itemModel: grape,
    );

    expect(find.text(grape.itemName!), findsOneWidget);

    expect(
        find.text(
          utilsServices.priceToCurrency(grape.price!),
        ),
        findsOneWidget);

    expect(find.text('/${grape.unit}'), findsOneWidget);

    expect(find.byIcon(Icons.add_shopping_cart_outlined), findsWidgets);
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
      home: ItemTile(
        item: itemModel,
      ),
    ),
  );

  await tester.pump();
}
