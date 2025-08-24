import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/custom_text_feild.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';

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

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meal Name', style: AppTextStyles.black16MediumStyle),
              const HeightSpace(8),
              CustomTextField(
                hintText: "BreakFast",
                controller: mealNameController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please inter meal name";
                  } else if (val.length < 3) {
                    return "please inter more than 3 character";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
