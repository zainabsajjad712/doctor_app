import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/utils/validation.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../router/app_routes.dart';
import 'generate_controller.dart';

class GenerateLoginView extends GetView<GenerateLoginController> {
  const GenerateLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
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

                Text(
                  "Password",
                  style: GoogleFonts.openSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  controller: controller.passwordController,
                  hint: "Enter password",
                  obscureText: true,
                  validator: Validation.passwordValidation,
                ),

                SizedBox(height: 30.h),

                Text(
                  "Confirm Password",
                  style: GoogleFonts.openSans(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  controller: controller.confirmPasswordController, // ✅ FIXED
                  hint: "Enter confirm password",
                  obscureText: true,
                  validator: (v) => Validation.confirmPasswordValidation(
                    v,
                    controller.passwordController.text,
                  ),
                ),

                SizedBox(height: 60.h),

                CustomButton(
                  text: "Next",
                  borderRadius: 30,
                  color: AppColor.primaryButton,
                  onTap: () {
                    Get.toNamed(AppRoutes.homescreen);
                  },
                  //controller.onNext,
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
