import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_minia/core/resources/color_manager.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/features/home/data/model/categories_model.dart';

import '../../../core/resources/text_style.dart';

class CategoryWidget extends StatelessWidget {
  final CategoriesResponse category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12.w),
      child: Container(
        alignment: Alignment.bottomLeft,
        width: 127,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageManager.item)),
            borderRadius: BorderRadius.circular(16),
            color: ColorManager.primaryColor,
            border: Border.all(color: ColorManager.greyColorC6)),
        child: Container(
          alignment: Alignment.center,
          height: 27.h,
          decoration: BoxDecoration(
              color: ColorManager.lightPurpleColorF5,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r))),
          child: Text(
            '${category.name}',
            textAlign: TextAlign.center,
            style: TextStyles.inputLabel,
          ),
        ),
      ),
    );
  }
}
