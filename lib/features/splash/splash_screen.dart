import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_minia/core/resources/routes.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/image_manager.dart';
import 'logic/splash_cubit.dart';
import 'logic/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigateTo(context);
    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is OnBoarding) {
            Navigator.pushReplacementNamed(context, Routes.onBoarding);
          } else if (state is Login) {
            Navigator.pushReplacementNamed(context, Routes.login);
          } else {
            Navigator.pushReplacementNamed(context, Routes.home);
          }
        },
        child: Scaffold(
          backgroundColor: ColorManager.primaryColor,
          body: Center(child: SvgPicture.asset(ImageManager.logo)),
        ));
  }

  void navigateTo(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (!context.mounted) return;
      context.read<SplashCubit>().navigateToScreen();
    });
  }
}
/*
isSeen -> false
          -> onboarding -> login -> home
isSeen -> true
          -> isLoggedIn -> false
                    -> login -> home
          -> isLoggedIn -> true
                    -> home

 */
