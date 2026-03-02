import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_controller.dart';
import 'package:doctor_app/src/features/online_consultation/widget/custom_doctor_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'doctor_controller.dart';

class FindDoctorView extends GetView<OnlineConsultationController> {
  const FindDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.white,
        elevation: 0,
        titleSpacing: 16.w,
        title: Text(
          "Find Doctors",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: AppColor.inputFill,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.filter, // yahan apni class ka naam likhein
                  width: 18.w,
                  height: 18.w,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF111827),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),

            Container(
              height: 44.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColor.containerBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SvgPicture.asset(
                      AppIcons.search, // yahan apni class ka naam likhein
                      width: 18.w,
                      height: 18.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF111827),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      onChanged: controller.onSearchChanged,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF111827),
                      ),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            Text(
              "Interested Doctors",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 10.h),

            // List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: controller.filteredDoctors.length,
                  padding: EdgeInsets.only(bottom: 12.h),

                  itemBuilder: (context, index) {
                    final d = controller.filteredDoctors[index];

                    return DoctorCard(
                      d: d,
                      showStats: false,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.onlineConsultationDetails,
                          arguments: d,
                        );
                      },
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 16.h),

            Text(
              "All Doctors",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 10.h),

            // List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: controller.filteredDoctors.length,
                  padding: EdgeInsets.only(bottom: 12.h),

                  itemBuilder: (context, index) {
                    final d = controller.filteredDoctors[index];

                    return DoctorCard(
                      d: d,
                      showStats: false,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.onlineConsultationDetails,
                          arguments: d,
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorView extends StatelessWidget {
  DoctorView({super.key});

  final FindDoctorController controller = Get.put(
    FindDoctorController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                children: [
                  Text(
                    "Find Doctors",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.inputFill,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.filter,
                        width: 18.w,
                        height: 18.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF111827),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Container(
                height: 44.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SvgPicture.asset(
                        AppIcons.search, // yahan apni class ka naam likhein
                        width: 18.w,
                        height: 18.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF111827),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        //  onChanged: controller.onSearchChanged,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF111827),
                        ),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF9CA3AF),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Interested Doctors Title
              Text(
                "Interested Doctors",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              /// LIST SECTION
              Expanded(
                child: Obx(() {
                  if (controller.filteredDoctors.isEmpty) {
                    return const Center(child: Text("No Doctors Found"));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //     DoctorCard(
                        //   d: d,
                        //   showStats: false,
                        //   onTap: () {
                        //     Get.toNamed(
                        //       AppRoutes.onlineConsultationDetails,
                        //       arguments: d,
                        //     );
                        //   },
                        // ),
                        /// 🔹 First Doctor Only
                        _doctorCard(controller.filteredDoctors.first),
                        const SizedBox(height: 25),

                        /// 🔹 All Doctors Title
                        Text(
                          "All Doctors",
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 Remaining Doctors
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.filteredDoctors.length - 1,
                          itemBuilder: (context, index) {
                            final doctor =
                                controller.filteredDoctors[index + 1];
                            return _doctorCard(doctor);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Doctor Card Widget
  Widget _doctorCard(Map<String, String> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              imageUrl: doctor["image"] ?? "",
              height: 75,
              width: 75,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                height: 75,
                width: 75,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor["hospital"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF2673FF),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                doctor["name"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF292D32),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Text(
                doctor["specialist"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF555B6C),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
