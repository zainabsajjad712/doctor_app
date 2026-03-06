import 'package:doctor_app/src/common/utils/validation.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constant/app_colors.dart';

class CreatePasswordView extends GetView<AuthController> {
  CreatePasswordView({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.w),
        child: Obx(() {
          final loading = controller.isLoading.value;

          return CustomButton(
            text: "Next",
            borderRadius: 30,
            color: AppColor.primaryButton,
            isLoading: loading,
            onTap: () {
              if (!loading) controller.onNext();
            },
          );
        }),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: controller.formKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),

                  Text(
                    "Generate login code",
                    style: GoogleFonts.openSans(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    "Enter a 6 digit password to use to protect your\nhealth records and log in next time.",
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.lightGreyTextColor,
                    ),
                  ),

                  SizedBox(height: 80.h),

                  /// PASSWORD
                  Text(
                    "Password",
                    style: GoogleFonts.openSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  CustomTextFormField(
                    controller: passwordController,
                    hint: "Enter 6 digit password",
                    obscureText: true,
                    validator: Validation.passwordValidation,
                  ),

                  SizedBox(height: 30.h),

                  /// CONFIRM PASSWORD
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.openSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  CustomTextFormField(
                    controller: confirmPasswordController,
                    hint: "Enter confirm password",
                    obscureText: true,
                    validator: (value) => Validation.confirmPasswordValidation(
                      value,
                      passwordController.text,
                    ),
                  ),

                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
