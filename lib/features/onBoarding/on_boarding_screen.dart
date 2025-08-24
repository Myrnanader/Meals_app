

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/onBoarding/on_boarding_services/on_boarding_services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titles = [
    "Save Your Meals Ingredient",
    "Use Our App The Best Choice",
    "Our App Your Ultimate Choice",
  ];
  List<String> descriptions = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    "All the best restaurants and their top menus are ready for you",
  ];

  int currentIndexPage = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await OnBoardingServices.initializeSharedPreferencesStorage();
    bool isFirstTime = OnBoardingServices.isFirstTime();
    log('isFirstTime: $isFirstTime');
    OnBoardingServices.setFirstTimeWithFalse();
    if (isFirstTime == false) {
      GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onBoardingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  children: [
                    const HeightSpace(32),
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: 250.h,
                        viewportFraction: .9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndexPage = index;
                          });
                        },
                      ),
                      items: List.generate(titles.length, (index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: 252.w,
                              //height: 300.h,
                              child: Column(
                                children: [
                                  Text(
                                    titles[index],
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.onBoardingTitleStyle,
                                  ),
                                  HeightSpace(16),
                                  Text(
                                    descriptions[index],
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles
                                        .onBoardingDescriptionStyle,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    const HeightSpace(5),
                    DotsIndicator(
                      dotsCount: titles.length,
                      position: currentIndexPage.toDouble(),
                      decorator: DotsDecorator(
                        size: const Size(24, 6),
                        activeSize: const Size(24, 6),
                        color: Color(0xffC2C2C2),
                        activeColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onTap: (index) {
                        carouselController.animateToPage(index);
                        currentIndexPage = index;
                        setState(() {});
                      },
                    ),

                    const HeightSpace(30),
                    currentIndexPage >= 2
                        ? InkWell(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.homeScreen);
                            },
                            child: Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  GoRouter.of(
                                    context,
                                  ).pushReplacementNamed(AppRoutes.homeScreen);
                                },
                                child: Text(
                                  "Skip",
                                  style: AppTextStyles.white14SemiBoldStyle,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (currentIndexPage < 2) {
                                    currentIndexPage++;
                                    carouselController.animateToPage(
                                      currentIndexPage,
                                    );
                                    setState(() {});
                                  }
                                },
                                child: Text(
                                  "Next",
                                  style: AppTextStyles.white14SemiBoldStyle,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
