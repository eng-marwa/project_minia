import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_minia/core/resources/color_manager.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/core/resources/routes.dart';
import 'package:project_minia/features/auth/logic/password_visibility_cubit.dart';
import 'package:project_minia/utils/extension/context_extensions.dart';

import '../../../core/common_widgets/app_bar.dart';
import '../../../core/resources/button_style.dart';
import '../../../core/resources/text_style.dart';
import '../../home/home.dart';
import '../logic/auth_bloc.dart';
import '../logic/auth_state.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: PharmaAppBar(title: 'Sign In')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                        controller: email,
                        label: 'Email',
                        icon: ImageManager.emailIcon,
                        hint: 'Enter your email'),
                    SizedBox(
                      height: 16.h,
                    ),
                    BlocBuilder<PasswordVisibilityCubit, bool>(
                        builder: (context, state) => CustomTextField(
                              controller: password,
                              label: 'Password',
                              icon: ImageManager.passwordIcon,
                              hint: 'Enter your password',
                              isPassword: true,
                              obscureState: state,
                              onPressed: () => context
                                  .read<PasswordVisibilityCubit>()
                                  .toggleVisibility(),
                            )),
                  ],
                )),
            SizedBox(
              height: 16.h,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password?',
                  style: TextStyles.inputLabel.copyWith(
                      color: ColorManager.indigoColor, fontSize: 14.sp),
                )),
            SizedBox(
              height: 25.h,
            ),
            ElevatedButton(
                style: ButtonStyles.primaryButton,
                onPressed: () => context
                    .read<AuthCubit>()
                    .login(email.value.text, password.value.text),
                child: Text(
                  'Sign In',
                  style: TextStyles.buttonLabel,
                )),
            BlocConsumer<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is AuthLoading,
              builder: (context, state) {
                if (state is AuthLoading) {
                  return CircularProgressIndicator();
                }
                return SizedBox();
              },
              listenWhen: (previous, current) =>
                  current is AuthSuccess || current is AuthFailure,
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.read<AuthCubit>().setLoggedIn(true);
                  context.navigateToReplacement(Routes.home);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text((state as AuthFailure).message)));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
