import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  Widget menuItem(icon, title, {VoidCallback? onTap, Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: color ?? AppColor.primaryBlue),
            SizedBox(width: 15.w),

            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBg,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://randomuser.me/api/portraits/men/32.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.doctorprofile);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Elon Musk",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            "Personal information",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.notifications_on_outlined),
                      ),

                      Positioned(
                        right: 3,
                        top: 3,
                        child: Obx(
                          () => controller.hasNotification.value
                              ? Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    color: AppColor.greenColor,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              menuItem(
                Icons.bookmark,
                "Interest list",
                onTap: () {
                  Get.toNamed(AppRoutes.interestList);
                },
              ),
              menuItem(
                Icons.lock,
                "Password and Security",
                onTap: () {
                  Get.toNamed(AppRoutes.passwordSecurity);
                },
              ),
              menuItem(Icons.people, "Join the community"),
              menuItem(Icons.description, "Terms and Policy",    onTap: () {
                  Get.toNamed(AppRoutes.terms);
                },),
              menuItem(Icons.help, "Frequently asked questions"),

              menuItem(Icons.phone, "Hotline 1900-2020", color: AppColor.primaryBlue),

              menuItem(Icons.logout, "Log out", color: AppColor.grey),
            ],
          ),
        ),
      ),
    );
  }
}
