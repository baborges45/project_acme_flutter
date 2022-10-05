// ignore_for_file: lines_longer_than_80_chars

import 'app_strings.dart';

class AppStringsPtBR implements AppStrings {
  // Base Screen
  @override
  String get bottomHome => 'Home';
  @override
  String get bottomShoppingCart => 'Carrinho';
  @override
  String get bottomOrderList => 'Pedidos';
  @override
  String get bottomProfile => 'Perfil';

  //Home Tab
  @override
  String get nameApp1 => 'Acme';
  @override
  String get nameApp2 => 'Inc';
  @override
  String get search => 'Pesquise aqui...';

  //product Screen
  @override
  String get addToCart => 'Add no carrinho';

  //Cart screen
  @override
  String get cart => 'Carrinho';
  @override
  String get grandTotal => 'Total Geral';
  @override
  String get completeOrder => 'Concluir pedido';

  //show dialog
  @override
  String get textConfirmation => 'Confirmação';
  @override
  String get textOptionConfirmation => 'Deseja realmente concluir o pedido?';
  @override
  String get notConfirmation => 'Não';
  @override
  String get yesConfirmation => 'Sim';

  //order screen
  @override
  String get confirmedOrder => 'Pedido confirmado';
  @override
  String get reversedPix => 'Pix estornado';
  @override
  String get pixPaymentDue => 'Pagamento Pix vencido';
  @override
  String get payment => 'Pagamento';
  @override
  String get preparing => 'Preparando';
  @override
  String get shipping => 'Envio';
  @override
  String get delivered => 'Entregue';
  @override
  String get order => 'Pedido: ';
  @override
  String get total => 'Total: ';
  @override
  String get qrCodeWithPix => 'Ver QR Code Pix';
}
