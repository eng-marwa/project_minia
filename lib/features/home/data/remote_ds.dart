import 'package:dio/dio.dart';
import 'package:project_minia/core/network/api_constants.dart';
import 'package:project_minia/core/network/api_result.dart';
import 'package:project_minia/core/network/dio_config.dart';
import 'package:project_minia/features/home/data/model/categories_model.dart';
import 'package:project_minia/features/home/data/model/products_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<ApiResult<List<CategoriesResponse>>> fetchCategories() async {
    try {
      Response response = await _dio.get(ApiConstants.categoriesEndPoint);
      if (response.statusCode == 200) {
        return ApiResult.success(
            data: (response.data as List)
                .map((e) => CategoriesResponse.fromJson(e))
                .toList());
      } else {
        return ApiResult.error(
            message: response.statusMessage ?? 'Unable to fetch data');
      }
    } catch (e) {
      return ApiResult.error(message: e.toString());
    }
  }

  Future<ApiResult<ProductsResponse>> fetchProducts() async {
    try {
      Response response = await _dio.get(ApiConstants.productsEndPoint);
      if (response.statusCode == 200) {
        return ApiResult.success(
            data: ProductsResponse.fromJson(response.data));
      } else {
        return ApiResult.error(
            message: response.statusMessage ?? 'Unable to fetch data');
      }
    } catch (e) {
      return ApiResult.error(message: e.toString());
    }
  }
}
