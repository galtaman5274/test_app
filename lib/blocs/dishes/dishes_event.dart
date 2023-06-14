// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dishes_bloc.dart';

abstract class DishesEvent extends Equatable {
  const DishesEvent();
}

class DishesStarted extends DishesEvent {
  @override
  List<Object> get props => [];
}

class DishesFiltered extends DishesEvent {
  final Teg teg;
  const DishesFiltered({
    required this.teg,
  });
  @override
  List<Object> get props => [];
}
