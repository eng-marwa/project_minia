import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_minia/core/resources/color_manager.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/features/home/data/model/products_model.dart';
import 'package:project_minia/features/home/logic/home_cubit.dart';

import '../../../core/resources/text_style.dart';
import '../logic/home_state.dart';

class SingleItemWidget extends StatefulWidget {
  final int index;
  final Products product;

  const SingleItemWidget(
      {super.key, required this.index, required this.product});

  @override
  State<SingleItemWidget> createState() => _SingleItemWidgetState();
}

class _SingleItemWidgetState extends State<SingleItemWidget> {
  bool isVisible = false;

  @override
  void initState() {
    context.read<HomeCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 12),
      child: Container(
        height: 168.h,
        width: 148.w,
        decoration: BoxDecoration(
            color: widget.index.isEven
                ? ColorManager.lightBlueColorF5C
                : ColorManager.lightGreenColorF5C,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorManager.greyColorC6)),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) =>
                      Text('No image available for this product'),
                  image: NetworkImage(widget.product.images?.first ?? ''),
                )),
                height: 80,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 8.h, right: 8.w),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImageManager.goldBanner,
                      height: 24,
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        List<Products> favoriteProducts =
                            context.read<HomeCubit>().getFavorites();
                        bool isFavorite = favoriteProducts
                            .any((p) => p.id == widget.product.id);
                        if (isFavorite) {
                          context
                              .read<HomeCubit>()
                              .removeFromFavorites(widget.product);
                        } else {
                          context
                              .read<HomeCubit>()
                              .addToFavorites(widget.product);
                        }
                      },
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          List<Products> favoriteProducts =
                              context.read<HomeCubit>().getFavorites();
                          bool isFavorite = favoriteProducts
                              .any((p) => p.id == widget.product.id);
                          return SvgPicture.asset(
                            isFavorite ? ImageManager.fav : ImageManager.nFav,
                            width: 24,
                            height: 24,
                          );
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
                      child: SizedBox(
                        width: 168.w,
                        child: Text(
                          widget.product.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.inputLabel,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Text(
                        '${widget.product.rating}',
                        style: TextStyles.inputLabel,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
                          child: Text(
                            '${widget.product.price}',
                            style: TextStyles.inputLabel,
                          ),
                        ),
                        SvgPicture.asset(
                          ImageManager.cart,
                          width: 32,
                          height: 32,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
