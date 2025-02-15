import 'package:flutter/material.dart';

import 'color_manager.dart';

class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 48),
    backgroundColor: ColorManager.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  );
}
