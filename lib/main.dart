import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/routing/router_generation_config.dart';

import 'package:meals_app/features/onBoarding/on_boarding_services/on_boarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //DatabaseHelper databaseHelper = DatabaseHelper.instance;
  /*
  databaseHelper.insertMeal(Meal(name: "Burger", description: "Delicious Burger", imageUrl: 'https://wallpapercave.com/wp/wp1987065.jpg', rate: 4.5, time: '20-30'));
  databaseHelper.insertMeal(Meal(name: "Fried", description: "Delicious Fried", imageUrl: 'https://wallpapercave.com/wp/wp1987065.jpg', rate: 4.9, time: '10-20'));
  databaseHelper.insertMeal(Meal(name: "Chicken", description: "Delicious Chicken", imageUrl: 'https://wallpapercave.com/wp/wp1987065.jpg', rate: 4.6, time: '30-40'));
      */
  await OnBoardingServices.initializeSharedPreferencesStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Meals App',
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
