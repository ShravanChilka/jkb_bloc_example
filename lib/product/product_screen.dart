import 'package:bloc_practice/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/cart/bloc/cart_event.dart';
import 'package:bloc_practice/cart/cart_screen.dart';
import 'package:bloc_practice/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final products = List.generate(
  30,
  (index) => Product(name: 'Product $index', price: index++ * 100),
);

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag),
          ),
          const SizedBox(width: 24)
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toString()),
            trailing: TextButton(
              child: const Text('Add'),
              onPressed: () {
                context.read<CartBloc>().add(CartEventAdd(product: product));
              },
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
