import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_minia/core/resources/color_manager.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/core/resources/text_style.dart';

class SectionWidget extends StatelessWidget {
  final String sectionTitle;
  const SectionWidget({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 21.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionTitle,
                style: TextStyles.sectionTitle,
              ),
              SvgPicture.asset(ImageManager.underline)
            ],
          ),
          Text(
            'See All',
            style: TextStyles.buttonLabel
                .copyWith(color: ColorManager.secondaryColor),
          )
        ],
      ),
    );
  }
}
