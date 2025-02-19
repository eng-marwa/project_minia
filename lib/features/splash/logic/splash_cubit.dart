import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/repositories/app_repository.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppRepository _repository;

  SplashCubit(this._repository) : super(const SplashState.initial());

  Future<void> navigateToScreen() async {
    final isSeen = await _repository.isSeen();
    final isLoggedIn = await _repository.isLoggedIn();
    if (!isSeen) {
      emit(SplashState.onboarding());
      return;
    }

    if (isLoggedIn) {
      emit(SplashState.home());
    } else {
      emit(SplashState.login());
    }
  }
}
