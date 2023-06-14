part of 'catalog_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CatalogLoading extends CategoryState {}

class CatalogLoaded extends CategoryState {
  const CatalogLoaded(this.categories);

  final List<Category> categories;

  @override
  List<Object> get props => [categories];
}

class CatalogError extends CategoryState {}
