import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_minia/core/resources/image_manager.dart';
import 'package:project_minia/features/home/logic/home_cubit.dart';
import 'package:project_minia/features/home/widgets/bottom_nav_bar.dart';
import 'package:project_minia/features/home/widgets/category_widget.dart';
import 'package:project_minia/features/home/widgets/single_item_widget.dart';

import '../../core/resources/button_style.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/text_style.dart';
import 'logic/home_state.dart';
import 'widgets/home_appbar.dart';
import 'widgets/section_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(104.h), child: HomeAppbar()),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      ImageManager.banner,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  top: 30,
                  left: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Discount ',
                        style: TextStyles.bold24Black,
                      ),
                      Text(
                        '50%',
                        style: TextStyles.bold24Black
                            .copyWith(color: ColorManager.redColorF5),
                      ),
                      SizedBox(),
                      ElevatedButton(
                          style: ButtonStyles.smallButton,
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: TextStyles.buttonLabel,
                          ))
                    ],
                  ),
                )
              ]),
              SectionWidget(sectionTitle: 'Categories'),
              _buildCategoriesList(),
              SectionWidget(sectionTitle: 'Offers'),
              _buildOffersList(),
              SectionWidget(sectionTitle: 'New Products'),
              _buildNewProductsList(),
            ],
          ))),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  _buildCategoriesList() {
    return SizedBox(
        height: 110.h,
        child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is CategoriesLoading ||
                current is CategoriesLoaded ||
                current is CategoriesFailure,
            builder: (context, state) {
              if (state is CategoriesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoriesLoaded) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) =>
                        CategoryWidget(category: state.categories[index]));
              } else if (state is CategoriesFailure) {
                return Center(
                  child: Text((state).message),
                );
              } else {
                return SizedBox();
              }
            }));
  }

  _buildOffersList() {
    return SizedBox(
        height: 168.h,
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is OffersLoading ||
              current is OffersLoaded ||
              current is OffersFailure,
          builder: (context, state) {
            if (state is OffersLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OffersLoaded) {
              return ListView.builder(
                  itemCount: state.products.products?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SingleItemWidget(
                        index: index,
                        product: state.products.products![index],
                      ));
            } else if (state is OffersFailure) {
              return Center(
                child: Text((state).message),
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }

  _buildNewProductsList() {
    return SizedBox(
        height: 188.h,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}
