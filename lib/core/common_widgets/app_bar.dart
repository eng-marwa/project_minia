import 'package:flutter/material.dart';
import 'package:project_minia/core/resources/color_manager.dart';

import '../resources/text_style.dart';

class PharmaAppBar extends StatelessWidget {
  const PharmaAppBar({super.key, required this.title, this.isBack = false});

  final String title;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBack,
      backgroundColor: ColorManager.primaryColor,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyles.appBarTitle,
    );
  }
}
