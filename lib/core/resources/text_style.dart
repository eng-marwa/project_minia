import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_minia/core/resources/color_manager.dart';

class TextStyles {
  TextStyles._();

  static TextStyle skip = TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      color: ColorManager.greyColor);

  static TextStyle title = TextStyle(
      fontSize: 26.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: ColorManager.primaryColor);

  static TextStyle description = TextStyle(
      fontSize: 13.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      color: ColorManager.primaryColor);

  static TextStyle appBarTitle = TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: ColorManager.blackColor);

  static TextStyle inputLabel = TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      color: ColorManager.blackColor);

  static TextStyle buttonLabel = TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: ColorManager.primaryColor);
}
