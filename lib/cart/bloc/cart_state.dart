import 'package:bloc_practice/product.dart';

class CartState {
  const CartState({
    required this.products,
  });

  final List<Product> products;
}
