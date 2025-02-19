import '../../../core/network/api_result.dart';
import '../data/model/login_model.dart';
import '../data/remote_ds/auth_api_service.dart';

class AuthRepository {
  final AuthApiService _authApiService;

  AuthRepository(this._authApiService);

  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    return await _authApiService.login(email, password);
  }
}
