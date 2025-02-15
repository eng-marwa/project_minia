import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_minia/presentation/auth/data/model/login_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial() = AuthInitial;

  factory AuthState.loading() = AuthLoading;

  factory AuthState.success(LoginResponse response) = AuthSuccess;

  factory AuthState.failure(String message) = AuthFailure;
}

// abstract class AuthState{}
// class AuthInitial extends AuthState{}
// class AuthLoading extends AuthState{}
// class AuthSuccess extends AuthState{}
// class AuthFailure extends AuthState{}
