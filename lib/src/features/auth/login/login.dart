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

      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
        child: CustomButton(
          text: "Next",
          borderRadius: 30.r,
          height: 55.h,
          fontWeight: FontWeight.w600,
          onTap: () {
            if (controller.formKey.currentState?.validate() ?? false) {
              if (controller.gender.value.isEmpty) {
                Get.snackbar("Error", "Please select gender");
                return;
              }
              Get.toNamed(AppRoutes.homescreen);
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Center(
              /// ✅ fields center + max width for better UI
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 520.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.h),

                      Text(
                        "Initialization of personal information",
                        style: GoogleFonts.openSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      Text(
                        "Create personal information to make booking easier",
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 34.h),

                      /// NAME
                      Text(
                        "Name",
                        style: GoogleFonts.openSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: controller.nameController,
                        hint: "Enter name",
                        validator: Validation.nameValidation,
                        borderRadius: 10.r,
                      ),

                      SizedBox(height: 22.h),

                      /// GENDER
                      Text(
                        "Gender",
                        style: GoogleFonts.openSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(child: genderButton("Male")),
                          SizedBox(width: 14.w),
                          Expanded(child: genderButton("Female")),
                        ],
                      ),

                      SizedBox(height: 22.h),

                      /// DOB
                      Text(
                        "Date of birth",
                        style: GoogleFonts.openSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: controller.dobController,
                        hint: "Choose your date",
                        readOnly: true,
                        validator: Validation.dobValidation, // ✅ add validator
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (picked != null) {
                              controller.dobController.text =
                                  "${picked.day}/${picked.month}/${picked.year}";
                              // ✅ revalidate if needed
                              controller.formKey.currentState?.validate();
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 22.h),

                      /// EMAIL
                      Text(
                        "Email",
                        style: GoogleFonts.openSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: controller.emailController,
                        hint: "Enter your email",
                        validator: Validation.emailValidation,
                        borderRadius: 10.r,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      /// ✅ Extra bottom padding so fields don't hide behind bottom button
                      SizedBox(height: 120.h),
                    ],
                  ),
                ),
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
        onTap: () {
          c.selectGender(text);

          // ❌ NOTE: yahan navigation mat karo warna flow break hoga
          // Get.toNamed(AppRoutes.date);
        },
        child: Container(
          height: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: c.gender.value == text
                ? AppColor.primaryButton
                : AppColor.inputFill,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: c.gender.value == text ? AppColor.white : AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
