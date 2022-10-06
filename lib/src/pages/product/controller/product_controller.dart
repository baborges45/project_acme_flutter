import 'package:get/get.dart';

import '../../../models/item_model.dart';
import '../../../models/product.dart';
import '../../../service/utils_services.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var items = <ItemModel>[].obs;
  RxString searchTitle = ''.obs;

  var productResult = [
    Product(
        id: 1,
        price: 10,
        productDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
            'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p.',
        productImage: 'https://picsum.photos/id/197/4272/2848',
        productName: 'Helicóptero'),
    Product(
        id: 2,
        price: 5,
        productDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
            'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop.',
        productImage: 'https://picsum.photos/id/209/1920/1280',
        productName: 'Bambolê'),
    Product(
        id: 3,
        price: 30,
        productDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
            'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desk.',
        productImage: 'https://picsum.photos/id/194/2000/1325',
        productName: 'Sábio'),
    Product(
      id: 4,
      price: 20,
      productName: 'Andador',
      productImage: 'https://picsum.photos/id/123/4928/3264',
      productDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
          'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
          'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
          'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
          'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with deskt.',
    ),
    Product(
        id: 5,
        price: 8,
        productDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
            'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with des.',
        productImage: 'https://picsum.photos/id/201/5184/3456',
        productName: 'Armário'),
    Product(
        id: 6,
        price: 15,
        productDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
            'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
            'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with de.',
        productImage: 'https://picsum.photos/id/194/2000/1325',
        productName: 'Fashion'),
  ];

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

  late final List<String> listName = adjetivos.followedBy(verbos).toList();

  Rx<List<Product>> foundPlayers = Rx<List<Product>>([]);

  UtilsServices utilsServices = UtilsServices();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    foundPlayers.value = productResult;

    debounce(
      searchTitle,
      (_) => searchTitle(),
      time: const Duration(milliseconds: 600),
    );
  }

  void filterPlayer(String playerName) {
    List<Product> results = [];
    if (playerName.isEmpty) {
      results = productResult;
    } else {
      results = productResult
          .where((element) => element.productName
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));

    products.value = productResult;
  }

  void toggleFavouriteStatus(int id) {
    productResult[id].isFavourite = !productResult[id].isFavourite;
    update();
  }
}
