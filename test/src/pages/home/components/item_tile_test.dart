import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_acme/commons/platform/platform_app.dart';
import 'package:flutter_project_acme/commons/resources/locale_images.dart';
import 'package:flutter_project_acme/commons/resources/localizations/br/cuppertino_localizations.dart';
import 'package:flutter_project_acme/commons/resources/translation.dart';
import 'package:flutter_project_acme/src/models/item_model.dart';
import 'package:flutter_project_acme/src/pages/home/components/item_tile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<String> verbos = [
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
    'Crachá',
    'Peneira',
    'Bafômetro',
    'Desentupidor',
    'Guarda-chuva',
    'Espanador',
    'Escudo',
    'Raquete',
    'Vaso sanitário',
    'Lancheira',
    'Cofre',
    'Helióstato',
    'Medalha',
    'Foguete',
    'Lata',
    'Sintetizador',
    'Grampo',
    'Bucha',
    'Catraca',
    'Alfinete',
    'Caneca',
    'Fita',
    'Moeda',
    'Gel',
    'Maquete',
    'Interfone',
    'Gaveta',
    'Helicóptero',
    'Vela de cera',
    'Quimono',
    'Bambolê',
    'Necessaire',
    'Machado',
    'Tecido',
    'Vareta de freio',
    'Obra de arte',
    'Canga',
  ];

  List<String> adjetivos = [
    'prepotente',
    'valioso',
    'legítimo',
    'desleixado',
    'Natural',
    'inteligente',
    'disciplinado',
    'louvável',
    'amargurado',
    'honesto',
    'odioso',
    'vergonhoso',
    'horroroso',
    'magnífico',
    'gordo',
    'romântico',
    'sublime',
    'mesquinho',
    'injusto',
    'medroso',
    'otário',
    'quente',
    'intenso',
    'Sábio',
    'zeloso',
    'desapegado',
    'faceiro',
    'companheiro',
    'empenhado',
    'espantoso',
    'traidor',
    'perfeccionista',
    'Qualificado',
    'feio',
    'tolerante',
    'orgulhoso',
    'ignorante',
    'lutador',
    'desejado',
    'exigente',
    'nostálgico',
    'próspero',
    'compreensivo',
    'excelente',
    'estourado',
    'malvado',
    'windsurfista',
    'verdadeiro',
    'melhor',
    'terno'
  ];

  final List<String> items = adjetivos.followedBy(verbos).toList();

  ItemModel grape = ItemModel(
    imgUrl: LocaleImages().fruitGrape,
    itemName: items,
    price: 7.4,
    unit: 'kg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
        'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
        'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
        'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
        'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with de.',
  );

  testWidgets('test find all widgets item tile', (tester) async {
    await _createWidget(
      tester,
      itemModel: grape,
    );

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
