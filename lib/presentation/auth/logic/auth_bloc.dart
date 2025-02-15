import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_minia/core/network/api_result.dart';
import 'package:project_minia/presentation/auth/domain/auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthState.initial());

  Future<void> login(String email, String password) async {
    emit(AuthState.loading());
    ApiResult result = await _authRepository.login(email, password);
    result.when(
        success: (data) => emit(AuthState.success(data)),
        error: (message) => AuthState.failure(message));
  }
}
