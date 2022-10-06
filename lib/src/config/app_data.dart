import '../models/order_model.dart';

import '../models/cart_item_model.dart';
import '../models/item_model.dart';

ItemModel apple = ItemModel(
  id: 1,
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
      'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p.',
  imgUrl: 'https://picsum.photos/id/123/4928/3264',
  itemName: listName,
  price: 10.0,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  id: 2,
  imgUrl: 'https://picsum.photos/id/197/4272/2848',
  itemName: listName,
  price: 7.92,
  unit: 'kg',
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
      'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop.',
);

ItemModel guava = ItemModel(
  id: 3,
  imgUrl: 'https://picsum.photos/id/209/1920/1280',
  itemName: listName,
  price: 11.5,
  unit: 'kg',
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
      'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desk.',
);

ItemModel kiwi = ItemModel(
  id: 4,
  imgUrl: 'https://picsum.photos/id/201/5184/3456',
  itemName: listName,
  price: 2.5,
  unit: 'un',
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
      'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with deskt.',
);

ItemModel mango = ItemModel(
  id: 5,
  imgUrl: 'https://picsum.photos/id/21/3008/2008',
  itemName: listName,
  price: 2.5,
  unit: 'un',
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
      'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with des.',
);

ItemModel papaya = ItemModel(
  id: 6,
  imgUrl: 'https://picsum.photos/id/194/2000/1325',
  itemName: listName,
  price: 8,
  unit: 'kg',
  description:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
      'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, '
      'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with de.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
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

final List<String> listName = adjetivos.followedBy(verbos).toList();

List<String> categories = [
  'Acessórios',
  'Tecnologia',
  'Sapatos',
  'Perfumes',
  'Lugares',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
    id: '123',
    price: 10,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
    id: '456',
    price: 10,
  ),
  CartItemModel(
    item: guava,
    quantity: 3,
    id: '789',
    price: 10,
  ),
];

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
        id: '123',
        price: 10,
      ),
      CartItemModel(
        item: mango,
        quantity: 1,
        id: '456',
        price: 10,
      ),
    ],
  ),

  // Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-11-08 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
        id: '007',
        price: 10,
      ),
    ],
  ),
];
