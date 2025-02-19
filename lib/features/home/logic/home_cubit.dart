import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_minia/core/network/api_result.dart';
import 'package:project_minia/features/home/data/model/categories_model.dart';
import 'package:project_minia/features/home/data/model/products_model.dart';
import 'package:project_minia/features/home/data/product_mapper.dart';

import '../domain/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeState.initial());

  Future<void> fetchCategories() async {
    emit(HomeState.categoriesLoading());
    ApiResult<List<CategoriesResponse>> fetchCategories =
        await _homeRepository.fetchCategories();
    fetchCategories.when(success: (List<CategoriesResponse> data) {
      emit(HomeState.categoriesLoaded(data));
    }, error: (String message) {
      emit(HomeState.categoriesFailure(message));
    });
  }

  Future<void> fetchProducts() async {
    emit(HomeState.offersLoading());
    ApiResult<ProductsResponse> fetchCategories =
        await _homeRepository.fetchProducts();
    fetchCategories.when(success: (ProductsResponse data) {
      emit(HomeState.offersLoaded(data));
    }, error: (String message) {
      emit(HomeState.offersFailure(message));
    });
  }

  addToFavorites(Products product) async {
    await _homeRepository.addToFavorites(product);
    emit(HomeState.addToFavoritesSuccess(ProductsMapper.toEntity(product)));
  }

  removeFromFavorites(Products product) async {
    await _homeRepository.removeFromFavorites(product);
    emit(
        HomeState.removeFromFavoritesSuccess(ProductsMapper.toEntity(product)));
  }

  List<Products> getFavorites() {
    return _homeRepository.getFavorites();
  }

// removeFromFavorites(Products product) async {
//   int row = await _homeRepository.removeFromFavorites(product);
//   if (row != null) {
//     emit(HomeState.removeFromFavoritesSuccess());
//   } else {
//     emit(HomeState.removeFromFavoritesFailure('Failed to add to favorites'));
//   }
// }
}
