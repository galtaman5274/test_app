part of 'dishes_bloc.dart';

abstract class DishesState extends Equatable {
  const DishesState();

  @override
  List<Object> get props => [];
}

class DishesLoading extends DishesState {}

class DishesLoaded extends DishesState {
  const DishesLoaded(this.dishes);

  final List<Dish> dishes;

  @override
  List<Object> get props => [dishes];
}
class DishesFilteredState extends DishesState {
  const DishesFilteredState(this.tegs);

  final List<Teg> tegs;

  @override
  List<Object> get props => [tegs];
}
class DishesError extends DishesState {}
