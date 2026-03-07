import 'package:doctor_app/src/features/doctorprofile/doctor_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorProfileView extends GetView<DoctorProfileController> {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// BLUE HEADER
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),

                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -50),
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/32.jpg",
                  ),
                ),
              ),

              Text(
                "Elon Musk",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),

                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      /// NAME
                      TextFormField(
                        controller: controller.nameController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Elon Musk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 15.h),

                      /// GENDER
                      Row(
                        children: [
                          Expanded(child: genderButton("Male")),

                          SizedBox(width: 10.w),

                          Expanded(child: genderButton("Female")),
                        ],
                      ),

                      SizedBox(height: 15.h),

                      /// PHONE
                      TextFormField(
                        controller: controller.phoneController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter phone";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 15.h),

                      /// EMAIL
                      TextFormField(
                        controller: controller.emailController,
                        validator: (v) {
                          if (!GetUtils.isEmail(v!)) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 25.h),

                      /// SAVE BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: controller.saveProfile,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text("Save", style: GoogleFonts.poppins()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget genderButton(String value) {
    return GestureDetector(
      onTap: () {
        controller.gender.value = value;
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: controller.gender.value == value
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          child: Text(value, style: GoogleFonts.poppins()),
        ),
      ),
    );
  }
}
