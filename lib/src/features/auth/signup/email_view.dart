import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:doctor_app/src/common/utils/validation.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../common/constant/app_colors.dart';
import 'email_controller.dart';

class EmailView extends GetView<AuthController> {
  EmailView({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.phone,
                        width: 150.w,
                        height: 150.h,
                      ),
                      SizedBox(height: 26.h),
                      CustomTextFormField(
                        controller: emailController,
                        hint: 'Enter email',
                        keyboardType: TextInputType.emailAddress,
                        validator: Validation.emailValidation,
                      ),

                      SizedBox(height: 10.h),
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

                Obx(() {
                  final loading = controller.isLoading.value;

                  return CustomButton(
                    onTap: () {
                      if (!loading) {
                        controller.onEmailNext();
                      }
                    },
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
      ),
    );
  }
}
