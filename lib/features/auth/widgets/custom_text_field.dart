import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/text_style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.label,
      required this.icon,
      required this.hint,
      this.isPassword = false,
      this.obscureState = false,
      this.onPressed,
      this.controller});

  final String label;
  final String icon;
  final String hint;
  bool? isPassword;
  bool? obscureState;
  VoidCallback? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.inputLabel,
        ),
        SizedBox(height: 10.h),
        TextFormField(
            controller: controller,
            keyboardType: isPassword == true
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: obscureState == true,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: ColorManager.redColor)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: ColorManager.borderColor)),
                prefixIcon: Padding(
                    padding: EdgeInsets.all(
                      12.r,
                    ),
                    child: SvgPicture.asset(
                      icon,
                      width: 24.w,
                      height: 24.h,
                    )),
                hintText: hint,
                suffixIcon: isPassword == true
                    ? IconButton(
                        onPressed: onPressed,
                        icon: obscureState == true
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility))
                    : null))
      ],
    );
  }
}
