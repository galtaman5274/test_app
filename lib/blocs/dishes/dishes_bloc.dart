import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repository/categories/dishes.dart';
import '../../services/categories/dishes_service.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  DishesBloc({required this.dishesService}) : super(DishesLoading()) {
    on<DishesStarted>(_onStarted);
    on<DishesFiltered>(_onFiltered);
  }

  final DishesService dishesService;

  Future<void> _onStarted(
    DishesStarted event,
    Emitter<DishesState> emit,
  ) async {
    emit(DishesLoading());
    try {
      final dishes = await dishesService.getDishes();
      emit(DishesLoaded(dishes));
    } catch (_) {
      emit(DishesError());
    }
  }

  Future<void> _onFiltered(
    DishesFiltered event,
    Emitter<DishesState> emit,
  ) async {
    emit(DishesLoading());
    try {
      final dishes = await dishesService.getDishes();
      dishes.where((e) => e.tegs.contains(event.teg));
      emit(DishesLoaded(dishes));
    } catch (_) {
      emit(DishesError());
    }
  }
}
