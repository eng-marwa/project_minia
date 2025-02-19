import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_minia/features/home/domain/entity/products_entity.dart';
import 'package:project_minia/features/home/domain/repository/home_repository.dart';
import 'package:project_minia/features/home/logic/home_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/remote_ds/auth_api_service.dart';
import '../../features/auth/domain/auth_repository.dart';
import '../../features/auth/logic/auth_bloc.dart';
import '../../features/auth/logic/password_visibility_cubit.dart';
import '../../features/home/data/remote_ds.dart';
import '../../features/onboarding/logic/onboadring_cubit.dart';
import '../../features/splash/logic/splash_cubit.dart';
import '../data/local/preference_helper.dart';
import '../network/dio_config.dart';
import '../repositories/app_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> getHive() async {
  //hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsEntityAdapter());
  Box<ProductsEntity> box = await Hive.openBox<ProductsEntity>('favorites');
  getIt.registerLazySingleton(() => box);
}

Future<void> setupDependencies() async {
  //shared preferences
  getIt.registerFactoryAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );
  getIt.registerLazySingleton(
    () => PreferenceHelper(),
  );
  //dio
  getIt.registerLazySingleton<Dio>(() => DioConfig.getDio());

  //services
  getIt.registerLazySingleton(() => AuthApiService(getIt()));
  getIt.registerLazySingleton(() => ApiService(getIt()));

  //repositories
  getIt.registerFactory(
    () => AuthRepository(getIt()),
  );
  getIt.registerFactory(
    () => AppRepository(getIt()),
  );
  getIt.registerFactory(
    () => HomeRepository(getIt(), getIt()),
  );

  //cubits
  getIt.registerLazySingleton(() => AuthCubit(getIt(), getIt()));
  getIt.registerLazySingleton(() => SplashCubit(getIt()));
  getIt.registerLazySingleton(() => OnBoardingCubit(getIt()));
  getIt.registerLazySingleton(() => PasswordVisibilityCubit());
  getIt.registerLazySingleton(() => HomeCubit(getIt()));
}
