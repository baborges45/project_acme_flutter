import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_acme/commons/platform/platform_app.dart';
import 'package:flutter_project_acme/commons/resources/locale_images.dart';
import 'package:flutter_project_acme/commons/resources/locale_strings.dart';
import 'package:flutter_project_acme/commons/resources/localizations/br/cuppertino_localizations.dart';
import 'package:flutter_project_acme/commons/resources/translation.dart';
import 'package:flutter_project_acme/src/models/item_model.dart';
import 'package:flutter_project_acme/src/pages/product/product_screen.dart';
import 'package:flutter_project_acme/src/service/utils_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ItemModel grape = ItemModel(
    imgUrl: LocaleImages().fruitGrape,
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg',
    description:
        'A melhor uva da região e que conta com o melhor preço de qualquer quitanda.'
        ' Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  );

  final UtilsServices utilsServices = UtilsServices();

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

    expect(
        find.text(utilsServices.priceToCurrency(grape.price!)), findsOneWidget);

    expect(find.text(grape.itemName!), findsOneWidget);

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
      home: ProductScreen(
        itemModel: itemModel!,
      ),
    ),
  );

  await tester.pump();
}
