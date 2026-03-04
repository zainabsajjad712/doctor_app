import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constant/app_colors.dart';
import 'phone_controller.dart';

class PhoneView extends GetView<MailController> {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.phone, height: 200.h),
                    SizedBox(height: 26.h),
                    // TextField
                    CustomEmailField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter email';
                        }

                        if (!GetUtils.isEmail(value.trim())) {
                          return 'Enter valid email';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Terms
                    Text(
                      'You agree to our terms and conditions of use by clicking\n'
                      'the "continue" button.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        height: 1.3,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // ✅ Bottom button (ALWAYS bottom)
              Obx(() {
                final loading = controller.isLoading.value;
                return CustomButton(
                  onTap: controller.onNext,
                  text: 'Next',
                  isLoading: loading,
                  borderRadius: 25.r,
                );
              }),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomEmailField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),

      decoration: InputDecoration(
        hintText: 'Enter your email',
        hintStyle: const TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.primaryButton, width: 1.4),
        ),
      ),

      validator: validator,
    );
  }
}
