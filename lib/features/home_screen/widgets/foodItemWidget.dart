import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';

class FoodItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function() onTap;
  const FoodItemWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Container(
          width: 153.w,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 137.w,
                height: 106.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
              const HeightSpace(8),
              Row(
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    style: AppTextStyles.black16MediumStyle,
                  ),
                ],
              ),
              const HeightSpace(8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primaryColor),
                      Text(
                        rate.toString(),
                        style: AppTextStyles.black16MediumStyle.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: AppColors.primaryColor),
                      Text(
                        time,
                        style: AppTextStyles.black16MediumStyle.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
