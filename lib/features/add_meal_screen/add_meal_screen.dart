import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/custom_text_feild.dart';
import 'package:meals_app/core/widgets/primary_button_widget.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home_screen/data/models/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController mealRateController = TextEditingController();
  TextEditingController mealDescriptionController = TextEditingController();
  TextEditingController mealTimeController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //isLoading = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Meal',
          style: AppTextStyles.black16MediumStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading == true
          ? SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meal Name',
                        style: AppTextStyles.black16MediumStyle,
                      ),
                      const HeightSpace(8),
                      CustomTextField(
                        hintText: "BreakFast",
                        controller: mealNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please inter meal name";
                          } else if (val.length < 3) {
                            return "please enter more than 3 character";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text(
                        'Image URL ',
                        style: AppTextStyles.black16MediumStyle,
                      ),
                      const HeightSpace(8),
                      CustomTextField(
                        hintText: "enter Image URL",
                        controller: imageUrlController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter meal URL";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text('Rate ', style: AppTextStyles.black16MediumStyle),
                      const HeightSpace(8),
                      CustomTextField(
                        hintText: "Rate Your Meal",
                        keyboardType: TextInputType.number,
                        controller: mealRateController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter meal Rate ";
                          }
                          return null;
                        },
                      ),

                      const HeightSpace(16),
                      Text('Time ', style: AppTextStyles.black16MediumStyle),
                      const HeightSpace(8),
                      CustomTextField(
                        hintText: "meal time",
                        keyboardType: TextInputType.number,
                        controller: mealTimeController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add meal time ";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text(
                        'Description',
                        style: AppTextStyles.black16MediumStyle,
                      ),
                      const HeightSpace(8),
                      CustomTextField(
                        hintText: "Description",
                        height: 120.h,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        controller: mealDescriptionController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter meal Description ";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(70),
                      PrimaryButtonWidget(
                        buttonText: "Add Meal",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            log(mealNameController.text);
                            log(mealDescriptionController.text);
                            log(mealRateController.text);
                            log(imageUrlController.text);
                            log(mealTimeController.text);

                            isLoading = true;
                            setState(() {});
                            Meal meal = Meal(
                              name: mealNameController.text,
                              description: mealDescriptionController.text,
                              rate: double.parse(mealRateController.text),
                              imageUrl: imageUrlController.text,
                              time: mealTimeController.text,
                            );
                            dbHelper.insertMeal(meal).then((value) {
                              GoRouter.of(
                                context,
                              ).pushReplacement(AppRoutes.homeScreen);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
