import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_minia/features/home/data/model/categories_model.dart';
import 'package:project_minia/features/home/data/model/products_model.dart';
import 'package:project_minia/features/home/domain/entity/products_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.initial() = Initial;

  factory HomeState.categoriesLoading() = CategoriesLoading;

  factory HomeState.categoriesFailure(String message) = CategoriesFailure;

  factory HomeState.categoriesLoaded(List<CategoriesResponse> categories) =
      CategoriesLoaded;

  factory HomeState.offersLoading() = OffersLoading;

  factory HomeState.offersFailure(String message) = OffersFailure;

  factory HomeState.offersLoaded(ProductsResponse products) = OffersLoaded;

  factory HomeState.addToFavoritesSuccess(ProductsEntity products) =
      AddToFavoritesSuccess;
  factory HomeState.addToFavoritesFailure(String message) =
      AddToFavoritesFailure;

  factory HomeState.removeFromFavoritesSuccess(ProductsEntity products) =
      RemoveFromFavoritesSuccess;
  factory HomeState.removeFromFavoritesFailure(String message) =
      RemoveFromFavoritesFailure;
}
