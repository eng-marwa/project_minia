import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_minia/core/network/api_result.dart';
import 'package:project_minia/core/repositories/app_repository.dart';

import '../domain/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final AppRepository _appRepository;

  AuthCubit(this._authRepository, this._appRepository)
      : super(AuthState.initial());

  Future<void> login(String email, String password) async {
    emit(AuthState.loading());
    ApiResult result = await _authRepository.login(email, password);
    result.when(
        success: (data) => emit(AuthState.success(data)),
        error: (message) => AuthState.failure(message));
  }

  void setLoggedIn(bool value) {
    _appRepository.setLoggedIn(value);
  }
}
