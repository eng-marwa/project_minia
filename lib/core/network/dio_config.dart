import 'package:dio/dio.dart';
import 'package:project_minia/core/network/api_constants.dart';

class DioConfig {
  DioConfig._();

  static Duration timeout = Duration(seconds: 30);

  static Dio getDio() {
    Dio dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          error: true,
          responseHeader: true));
    return dio;
  }
}
