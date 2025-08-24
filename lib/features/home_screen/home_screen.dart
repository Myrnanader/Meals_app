import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home_screen/data/models/meal_model.dart';
import 'package:meals_app/features/home_screen/widgets/custom_top_home_part.dart';
import 'package:meals_app/features/home_screen/widgets/foodItemWidget.dart';

DatabaseHelper dbHelper = DatabaseHelper.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*
    dbHelper.getMeals().then((meals) {
      log('meals: $meals');
    });

    */
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePart(),
            const HeightSpace(25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Text(
                      "Your Food",
                      style: AppTextStyles.black16MediumStyle,
                    ),
                  ),
                  const HeightSpace(25),
                  Expanded(
                    child: FutureBuilder(
                      future: dbHelper.getMeals(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        } else if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Center(child: Text("No Meals found",style:AppTextStyles.onBoardingTitleStyle));
                          }
                          return GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            itemBuilder: (context, index) {
                              Meal meal = snapshot.data![index];
                              return FoodItemWidget(
                                imageUrl: meal.imageUrl,
                                name: meal.name,
                                rate: meal.rate,
                                time: meal.time,
                                onTap: () {},
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text("${snapshot.error}"));
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.addMealScreen);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 24.sp),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
