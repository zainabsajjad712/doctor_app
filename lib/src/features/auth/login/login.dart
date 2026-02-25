import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final controller = Get.find<PersonalInfoController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.inputFill,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: size.width > 500 ? 420 : size.width * 0.92,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Initialization of personal information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  /// NAME
                  const Text("Name"),
                  const SizedBox(height: 8),

                  CustomTextFormField(
                    controller: controller.nameController,
                    hint: "Enter name",
                    borderRadius: 10,
                  ),

                  const SizedBox(height: 16),

                  /// GENDERgit push
                  Obx(
                    () => Row(
                      children: [
                        Expanded(child: genderButton("Male")),
                        const SizedBox(width: 12),
                        Expanded(child: genderButton("Female")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// DOB
                  const Text("Date of birth"),
                  const SizedBox(height: 8),

                  CustomTextFormField(
                    controller: controller.dobController,
                    hint: "choose your date",
                    readOnly: true,
                    onTap: () =>
                        Get.toNamed(AppRoutes.date), // ✅ yahin replace kiya
                    // onTap: () => Get.to(() => const DateScreen()),
                    borderRadius: 10,
                  ),

                  const SizedBox(height: 16),

                  /// EMAIL
                  const Text("Email"),
                  const SizedBox(height: 8),

                  CustomTextFormField(
                    controller: controller.emailController,
                    hint: "Enter your email",
                    borderRadius: 10,
                  ),

                  const SizedBox(height: 26),

                  /// NEXT BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.date); // ✅ yahi replace kiya
                        // Get.to(() => const DateScreen());
                      },
                      child: const Text("Next"),
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

    return GestureDetector(
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
    );
  }
}
