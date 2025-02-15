import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_minia/core/network/dio_config.dart';
import 'package:project_minia/presentation/auth/data/remote_ds/auth_api_service.dart';
import 'package:project_minia/presentation/auth/domain/auth_repository.dart';
import 'package:project_minia/presentation/auth/logic/auth_bloc.dart';

import 'presentation/splash/splash_screen.dart';

class PharmaApp extends StatelessWidget {
  const PharmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              home: SplashScreen(),
            ));
  }
}
