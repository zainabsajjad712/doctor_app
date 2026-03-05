import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/constant/app_colors.dart';
import 'interest_list_controller.dart';

class InterestListView extends GetView<InterestListController> {
  const InterestListView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Back
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back),
              ),

              SizedBox(height: 20.h),

              Text(
                "Interest list",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              /// Tabs
              Obx(() => Row(
                    children: [
                      tabButton("Doctor", 0),
                      SizedBox(width: 10.w),
                      tabButton("Hospital", 1),
                      SizedBox(width: 10.w),
                      tabButton("News", 2),
                    ],
                  )),

              SizedBox(height: 40.h),

              Obx(() {

                if (controller.selectedTab.value == 0) {
                  return Column(
                    children: [
                      Text(
                        "You haven't followed any doctors yet",
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Choose the best doctor for you.",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 40.h),

                      Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColor.primaryButton,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Find doctors",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  );
                }

                return Column(
                  children: List.generate(
                    5,
                    (index) => Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1586773860418-d37222d8fce3",
                              height: 60.h,
                              width: 60.w,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 10.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mayo Clinic",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Text(
                                "200 First St, MN",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget tabButton(String text, int index) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == index
              ? AppColor.primaryBlue
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: controller.selectedTab.value == index
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}