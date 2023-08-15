import 'dart:async';
import 'dart:developer';

import 'package:bloc_practice/cart/bloc/cart_event.dart';
import 'package:bloc_practice/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(products: [])) {
    on<CartEventAdd>(_onCartEventAdd);
    on<CartEventRemove>(_onCartEventRemove);
  }

  FutureOr<void> _onCartEventAdd(
    CartEventAdd event,
    Emitter<CartState> emit,
  ) {
    log(event.toString());
    emit(
      CartState(
        products: [event.product, ...state.products],
      ),
    );
  }

  FutureOr<void> _onCartEventRemove(
    CartEventRemove event,
    Emitter<CartState> emit,
  ) {
    log(event.toString());
    emit(
      CartState(
        products: state.products..remove(event.product),
      ),
    );
  }
}
