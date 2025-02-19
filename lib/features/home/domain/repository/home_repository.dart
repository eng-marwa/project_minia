import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_minia/features/home/data/product_mapper.dart';
import 'package:project_minia/features/home/domain/entity/products_entity.dart';

import '../../../../core/network/api_result.dart';
import '../../data/model/categories_model.dart';
import '../../data/model/products_model.dart';
import '../../data/remote_ds.dart';

class HomeRepository {
  final ApiService _apiService;
  final Box<ProductsEntity> _favoritesBox;

  HomeRepository(this._apiService, this._favoritesBox);

  Future<ApiResult<List<CategoriesResponse>>> fetchCategories() async {
    return await _apiService.fetchCategories();
  }

  Future<ApiResult<ProductsResponse>> fetchProducts() async {
    return await _apiService.fetchProducts();
  }

  Future<void> addToFavorites(Products product) async {
    var entity = ProductsMapper.toEntity(product);
    await _favoritesBox.put(product.id, entity);
  }

  List<Products> getFavorites() {
    return _favoritesBox.values
        .map((e) => ProductsMapper.toProducts(e))
        .toList();
  }

  Future<void> removeFromFavorites(Products product) async {
    return await _favoritesBox.delete(product.id);
  }
}
