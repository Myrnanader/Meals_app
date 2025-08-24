import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';

class CustomTopHomePart extends StatelessWidget {
  const CustomTopHomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children:[
              Image.asset(AppAssets.homePageTopImage,width: double.infinity,height:300.h,fit :BoxFit.fill),
              Positioned(
                top:64,
                left:30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  width: 190.w,
                  height: 190.h,
                decoration: BoxDecoration(
                  color:Color(0xfffe8c001a).withOpacity(.1),
                  borderRadius: BorderRadius.circular(30.r)
                ),
                child: Text("Welcome \nAdd A New Recipe",style: AppTextStyles.onBoardingTitleStyle),
              ))
            ] );
  }
}