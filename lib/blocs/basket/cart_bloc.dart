import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:last_test_app/services/basket/basket_service.dart';
import 'package:meta/meta.dart';

import '../../repository/categories/dishes.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.basketRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final BaskteService basketRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items =  basketRepository.cartRepo.cart;
      emit(CartLoaded(cart:  [...items]));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        basketRepository.addToCart(event.item);
        emit(CartLoaded(cart:  [...state.cart, event.item]));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        basketRepository.removeFromCart(event.item);
        emit(
          CartLoaded(
            cart:  [...state.cart]..remove(event.item),
            
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
