import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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

                  SizedBox(width: 15.w),

                  Text(
                    "Privacy policy",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              Text(
                "Privacy Policy for Company Name",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                "At Website Name, accessible at Website.com, one of our main priorities is the privacy of our visitors.This Privacy Policy document contains types of information that is collected and recorded by Website Name and how we use it.",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 15.h),
              Text(
                "If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 25.h),
              Text(
                "Consent",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 10.h),
              Text(
                "By using our website, you hereby consent to our Privacy Policy and agree to its terms.",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 20.h),
              Text(
                "Information we collect",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                "The personal information that you are asked to provide, and the reasons why you are asked to provide it...",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
