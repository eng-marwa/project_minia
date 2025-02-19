import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 48.h),
    backgroundColor: ColorManager.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.r),
    ),
  );

  static ButtonStyle smallButton = ElevatedButton.styleFrom(
    minimumSize: Size(106.w, 34.h),
    backgroundColor: ColorManager.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
  );
}
