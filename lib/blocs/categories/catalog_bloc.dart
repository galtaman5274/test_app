import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repository/categories/categories.dart';
import '../../services/categories/categories_service.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CategoryBloc extends Bloc<CatalogEvent, CategoryState> {
  CategoryBloc({required this.categoryService}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  final CategoryService categoryService;

  Future<void> _onStarted(
    CatalogStarted event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final categories = await categoryService.getCategories();
      emit(CatalogLoaded(categories));
    } catch (_) {
      emit(CatalogError());
    }
  }
}
