import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/utils/validation.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(backgroundColor: AppColor.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Initialization of personal information",
                    style: GoogleFonts.openSans(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Text(
                    "Create personal information to make booking easier",
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  /// NAME
                  Text("Name"),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    controller: controller.nameController,
                    hint: "Enter name",
                    validator: Validation.nameValidation,
                    borderRadius: 10.r,
                  ),

                  SizedBox(height: 16.h),

                  /// GENDER
                  const Text("Gender"),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(child: genderButton("Male")),
                      SizedBox(width: 12.w),
                      Expanded(child: genderButton("Female")),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  /// DOB
                  const Text("Date of birth"),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () async {
                      final date = await Get.toNamed(AppRoutes.date);

                      if (date != null) {
                        controller.dobController.text =
                            "${date.day}/${date.month}/${date.year}";
                      }
                    },
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        controller: controller.dobController,
                        hint: "Choose your date",
                        validator: Validation.numberValidation,
                      ),
                    ),
                  ),

                  // CustomTextFormField(
                  //   controller: controller.dobController,
                  //   hint: "Choose your date",
                  //   // readOnly: true,
                  //   onTap: () async {
                  //     final date = await Get.toNamed(AppRoutes.date);

                  //     if (date != null) {
                  //       controller.dobController.text =
                  //           "${date.day}/${date.month}/${date.year}";
                  //     }
                  //   },
                  // ),
                  SizedBox(height: 16.h),

                  /// EMAIL
                  const Text("Email"),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    controller: controller.emailController,
                    hint: "Enter your email",
                    validator: Validation.emailValidation,
                    borderRadius: 10.r,
                  ),

                  SizedBox(height: 35.h),

                  /// NEXT BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                      text: "Next",
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          // gender check (manual validation)
                          if (controller.gender.value.isEmpty) {
                            Get.snackbar("Error", "Please select gender");
                            return;
                          }

                          Get.toNamed(AppRoutes.homescreen);
                        }
                      },
                      borderRadius: 30.r,
                      height: 55.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget genderButton(String text) {
    final c = Get.find<PersonalInfoController>();
    return Obx(
      () => GestureDetector(
        onTap: () => c.selectGender(text),
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: c.gender.value == text
                ? AppColor.primaryButton
                : AppColor.inputFill,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: c.gender.value == text ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
