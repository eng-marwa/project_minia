import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = Initial;
  const factory SplashState.onboarding() = OnBoarding;
  const factory SplashState.login() = Login;
  const factory SplashState.home() = Home;
}
