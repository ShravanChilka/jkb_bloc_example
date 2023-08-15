import 'package:bloc_practice/product.dart';

abstract class CartEvent {}

class CartEventAdd extends CartEvent {
  CartEventAdd({
    required this.product,
  });

  final Product product;
}

class CartEventRemove extends CartEvent {
  CartEventRemove({
    required this.product,
  });

  final Product product;
}
