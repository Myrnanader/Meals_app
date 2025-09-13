import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      top: 12.h,
                      left: 12.w,
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyColor),
                            color: AppColors.primaryColor.withOpacity(0.07),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.greyColor,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpace(16),
              Padding(
                padding: EdgeInsets.all(24.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name,
                      style: AppTextStyles.onBoardingTitleStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const HeightSpace(21),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: AppColors.primaryColor),
                              Text(
                                meal.rate.toString(),
                                style: AppTextStyles.black16MediumStyle
                                    .copyWith(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.timer, color: AppColors.primaryColor),
                              Text(
                                meal.time,
                                style: AppTextStyles.black16MediumStyle
                                    .copyWith(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HeightSpace(27),
                    const Divider(thickness: 2),
                    const HeightSpace(24),
                    Text(
                      "Description",
                      style: AppTextStyles.black16MediumStyle,
                    ),
                    const HeightSpace(8),
                    Text(
                      meal.description,
                      style: AppTextStyles.grey14RegularStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
