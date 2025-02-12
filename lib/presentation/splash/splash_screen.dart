import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_minia/presentation/onboarding/onboarding.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/image_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (!context.mounted) return;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ));
    });
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(child: SvgPicture.asset(ImageManager.logo)),
    );
  }
}
