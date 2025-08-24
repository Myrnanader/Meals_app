import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/features/add_meal_screen/add_meal_screen.dart';
import 'package:meals_app/features/home_screen/home_screen.dart';
import 'package:meals_app/features/onBoarding/on_boarding_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.addMealScreen,
        name:AppRoutes.addMealScreen,
        builder:(context,state) => const AddMealScreen(),

      )
    ],
  );
}