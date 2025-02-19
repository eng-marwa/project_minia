import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_minia/core/resources/color_manager.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/features/home/ui_model/navigation_item.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<NavigationItem> items = [
    NavigationItem(
        icon: SvgPicture.asset(
          ImageManager.home,
          width: 24,
          height: 24,
        ),
        label: 'Home'),
    NavigationItem(
        icon: SvgPicture.asset(
          ImageManager.inbox,
          width: 24,
          height: 24,
        ),
        label: 'Inbox'),
    NavigationItem(
        icon: SvgPicture.asset(
          ImageManager.favorites,
          width: 24,
          height: 24,
        ),
        label: 'Favorites'),
    NavigationItem(
        icon: SvgPicture.asset(
          ImageManager.profile,
          width: 24,
          height: 24,
        ),
        label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.secondaryColor,
          backgroundColor: ColorManager.primaryColor,
          items: items
              .map(
                (e) => BottomNavigationBarItem(icon: e.icon, label: e.label),
              )
              .toList()),
    );
  }
}
