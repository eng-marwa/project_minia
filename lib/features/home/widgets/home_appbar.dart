import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_minia/core/resources/color_manager.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/features/home/ui_model/action_item.dart';

import '../../../core/resources/text_style.dart';

class HomeAppbar extends StatelessWidget {
  HomeAppbar({super.key});

  final List<ActionItem> actions = [
    ActionItem(
      icon: SvgPicture.asset(
        ImageManager.searchIcon,
        width: 24,
        height: 24,
      ),
      callback: () {},
    ),
    ActionItem(
      icon: Badge(
          backgroundColor: ColorManager.greenColor,
          label: Text('5'),
          textColor: ColorManager.primaryColor,
          child: SvgPicture.asset(
            ImageManager.notificationsIcon,
            width: 24,
            height: 24,
          )),
      callback: () {},
    ),
    ActionItem(
      icon: Badge(
          backgroundColor: ColorManager.greenColor,
          label: Text('2'),
          textColor: ColorManager.primaryColor,
          child: SvgPicture.asset(
            ImageManager.shoppingCartIcon,
            width: 24,
            height: 24,
          )),
      callback: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35.r),
            bottomLeft: Radius.circular(35.r)),
      ),
      alignment: Alignment.bottomCenter,
      padding:
          EdgeInsets.only(top: 44.h, left: 24.w, right: 24.w, bottom: 16.h),
      child: AppBar(
          backgroundColor: Colors.transparent,
          leading: CircleAvatar(
            radius: 24.r,
            // backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          elevation: 0,
          title: Text(
            'Hello Mohamed 👋',
            style: TextStyles.description,
          ),
          actions: [
            SizedBox(
                width: 100.w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: actions.map((e) => e.icon).toList()))
          ]),
    );
  }
}
