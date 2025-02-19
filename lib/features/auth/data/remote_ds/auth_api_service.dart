import 'package:dio/dio.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_result.dart';
import '../model/login_model.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    try {
      Response response = await _dio.post(ApiConstants.loginEndPoint,
          data: {"username": email, "password": password});
      if (response.statusCode == 200) {
        return ApiResult.success(data: LoginResponse.fromJson(response.data));
      } else {
        return ApiResult.error(
            message: response.statusMessage ?? 'failed to login');
      }
    } catch (e) {
      return ApiResult.error(message: e.toString());
    }
  }
}
