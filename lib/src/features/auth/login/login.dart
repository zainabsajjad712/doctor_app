import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Initialization of personal information",
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "Create personal information to make booking easier",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),

                /// NAME
                const Text("Name"),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: controller.nameController,
                  hint: "Enter name",
                  borderRadius: 10,
                ),

                const SizedBox(height: 16),

                /// GENDER
                const Text("Gender"),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: genderButton("Male")),
                    const SizedBox(width: 12),
                    Expanded(child: genderButton("Female")),
                  ],
                ),

                const SizedBox(height: 16),

                /// DOB
                const Text("Date of birth"),
                const SizedBox(height: 8),
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
                const SizedBox(height: 16),

                /// EMAIL
                const Text("Email"),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: controller.emailController,
                  hint: "Enter your email",
                  borderRadius: 10,
                ),

                const SizedBox(height: 35),

                /// NEXT BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    text: "Next",
                    onTap: () {
                      Get.toNamed(AppRoutes.homescreen);
                    },
                    borderRadius: 30,
                    height: 55,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
              color: c.gender.value == text ? AppColor.white : AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
