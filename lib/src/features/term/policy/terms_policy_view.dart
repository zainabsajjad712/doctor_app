import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_policy_controller.dart';

class TermsPolicyView extends GetView<TermsPolicyController> {
  const TermsPolicyView({super.key});

  Widget item(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back, size: 22.sp),
                  ),

                  SizedBox(width: 13.w),

                  Text(
                    "Terms and Policy",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              item("Privacy policy", controller.goToPrivacy),
              item("Terms of use", controller.goToTerms),

              item("Regulations on booking activities", () {}),
              item("Complaint handling process", () {}),
              item("About", () {}),
            ],
          ),
        ),
      ),
    );
  }
}
