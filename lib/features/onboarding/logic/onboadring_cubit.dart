import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/repositories/app_repository.dart';

class OnBoardingCubit extends Cubit<int> {
  final AppRepository _repository;

  OnBoardingCubit(this._repository) : super(0);

  void setSeen(bool value) {
    _repository.setSeen(value);
  }
}
