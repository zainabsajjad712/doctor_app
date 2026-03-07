import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  Widget textField({
    required String hint,
    required TextEditingController controllerField,
    required bool obscure,
    required VoidCallback toggle,
  }) {
    return Obx(
      () => TextFormField(
        controller: controllerField,
        obscureText: obscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Field required";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(fontSize: 13.sp),

          filled: true,
          fillColor: AppColor.white,

          suffixIcon: IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: toggle,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),

          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      "Change the password",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Text(
                  "Current password",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => TextFormField(
                    controller: controller.currentPasswordController,
                    obscureText: controller.showCurrent.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter current password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter current password",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                      ),

                      filled: true,
                      fillColor: AppColor.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                Text(
                  "New password",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8.h),

                Obx(
                  () => TextFormField(
                    controller: controller.newPasswordController,
                    obscureText: controller.showNew.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter new password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter new password",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                      ),

                      filled: true,
                      fillColor: AppColor.white,

                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility_off),
                        onPressed: controller.toggleNew,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                Text(
                  "Confirm new password",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8.h),
                Obx(
                  () => TextFormField(
                    controller: controller.confirmPasswordController,
                    obscureText: controller.showConfirm.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter confirm password",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                      ),

                      filled: true,
                      fillColor: AppColor.white,

                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility_off),
                        onPressed: controller.toggleConfirm,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 240.h),

                /// CHANGE BUTTON
                GestureDetector(
                  onTap: controller.changePassword,

                  child: Container(
                    width: double.infinity,
                    height: 55.h,

                    decoration: BoxDecoration(
                      color: AppColor.primaryButton,
                      borderRadius: BorderRadius.circular(30.r),
                    ),

                    alignment: Alignment.center,

                    child: Text(
                      "Change",
                      style: GoogleFonts.poppins(
                        color: AppColor.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
