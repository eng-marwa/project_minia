import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_minia/features/onboarding/logic/onboadring_cubit.dart';
import 'package:project_minia/utils/extension/context_extensions.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/image_manager.dart';
import '../../core/resources/routes.dart';
import '../../core/resources/text_style.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'About us',
      description:
          'PharmaNow application helps people to find medicine and medical cosmetic products at reasonable prices and also provides daily and weekly offers on products',
      imagePath: ImageManager.image1,
    ),
    OnboardingData(
      title: 'E-Pharmacy',
      description:
          'Chat directly with a pharmacist or get instant help anytime with our smart AI chatbot',
      imagePath: ImageManager.image2,
    ),
    OnboardingData(
      title: 'Medical Delivery',
      description:
          'Spend time with your family and we will deliver everything you need',
      imagePath: ImageManager.image3,
    ),
  ];
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Stack(children: [
        Column(
          children: [
            Expanded(
                child: Column(
              children: [
                _buildCard(),
              ],
            ))
          ],
        ),
        PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          itemCount: _onboardingData.length,
          itemBuilder: (context, index) => _buildPage(_onboardingData[index]),
        )
      ]),
    );
  }

  Widget _buildPage(OnboardingData onboardingData) {
    return Column(
      children: [
        _topBar(),
        SizedBox(
          height: 120,
        ),
        SvgPicture.asset(
          onboardingData.imagePath,
          height: 300,
        ),
        SizedBox(
          height: 70,
        ),
        _buildInfoWidget(onboardingData)
      ],
    );
  }

  Widget _topBar() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
                visible: _currentPage != 0,
                child: InkWell(
                  child: SvgPicture.asset(ImageManager.leftArrow),
                  onTap: () => _pageController.animateToPage(--_currentPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                )),
            TextButton(
                onPressed: () {
                  context.read<OnBoardingCubit>().setSeen(true);
                  context.navigateToReplacement(Routes.login);
                },
                child: Text(
                  'Skip',
                  style: TextStyles.skip,
                ))
          ],
        ));
  }

  Widget _buildCard() {
    return Expanded(
        child: Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        width: double.infinity,
        child: SvgPicture.asset(
          ImageManager.footer,
          fit: BoxFit.fill,
        ),
      ),
    ]));
  }

  Widget _buildInfoWidget(OnboardingData onboardingData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              onboardingData.title,
              style: TextStyles.title,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              onboardingData.description,
              style: TextStyles.description,
              maxLines: 2,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _onboardingData
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e == onboardingData
                                  ? ColorManager.primaryColor
                                  : ColorManager.primaryColor.withAlpha(80)),
                        ),
                      ),
                    )
                    .toList()),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              child: SvgPicture.asset(ImageManager.next),
              onTap: () {
                if (_currentPage == _onboardingData.length - 1) {
                  //set isSeen to true
                  context.read<OnBoardingCubit>().setSeen(true);
                  context.navigateToReplacement(Routes.login);
                } else {
                  _pageController.animateToPage(++_currentPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
