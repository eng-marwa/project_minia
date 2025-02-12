import 'package:flutter/material.dart';
import 'package:project_minia/core/resources/color_manager.dart';

class TextStyles {
  TextStyles._();

  static const TextStyle skip = TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      color: ColorManager.greyColor);

  static const TextStyle title = TextStyle(
      fontSize: 26,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: ColorManager.primaryColor);

  static const TextStyle description = TextStyle(
      fontSize: 13,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      color: ColorManager.primaryColor);
}
