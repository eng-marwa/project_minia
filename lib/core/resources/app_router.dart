import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_minia/features/auth/logic/password_visibility_cubit.dart';
import 'package:project_minia/features/home/logic/home_cubit.dart';
import 'package:project_minia/features/onboarding/logic/onboadring_cubit.dart';

import '../../features/auth/logic/auth_bloc.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/home.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/splash/logic/splash_cubit.dart';
import '../../features/splash/splash_screen.dart';
import '../di/module.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<SplashCubit>(),
                child: SplashScreen()));

      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<OnBoardingCubit>(),
                child: OnboardingScreen()));

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => getIt<AuthCubit>()),
                  BlocProvider(
                    create: (context) => getIt<PasswordVisibilityCubit>(),
                  )
                ], child: LoginScreen()));

      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<HomeCubit>()
                  ..fetchCategories()
                  ..fetchProducts(),
                child: MyHomePage()));

      default:
        return undefinedRoute(settings);
    }
  }

  static Route<dynamic> undefinedRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
  }
}
