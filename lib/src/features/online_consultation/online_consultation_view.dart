import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:doctor_app/src/common/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnlineConsultationView extends GetView<OnlineConsultationController> {
  const OnlineConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16.w,
        title: Text(
          "online consultation",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF111827),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
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

            // Search Bar
            // CustomTextFormField(
            //   contentPadding: EdgeInsets.symmetric(
            //     horizontal: 12.w,
            //     vertical: 8.h,
            //   ),
            //   hint: "Search",
            //   prefixIcon: SvgPicture.asset(
            //     AppIcons.search,
            //     width: 18.w,
            //     height: 18.w,
            //     colorFilter: const ColorFilter.mode(
            //       Color(0xFF111827),
            //       BlendMode.srcIn,
            //     ),
            //   ),
            //   onChanged: controller.onSearchChanged,
            // ),
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

                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,
                            spreadRadius: 0,
                            offset: const Offset(0, 6),
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ✅ Big avatar (like screenshot)
                          Stack(
                            children: [
                              Container(
                                width: 92.w,
                                height: 92.w,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),

                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(18.r),
                                    topRight: Radius.circular(18.r),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: d.imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (_, __) => Center(
                                    child: SizedBox(
                                      width: 18.w,
                                      height: 18.w,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (_, __, ___) => Icon(
                                    Icons.person,
                                    size: 32.sp,
                                    color: const Color(0xFF9CA3AF),
                                  ),
                                ),
                              ),

                              // ✅ online dot (inside top-left like close image)
                              Positioned(
                                left: 10.w,
                                top: 10.h,
                                child: Container(
                                  width: 18.w,
                                  height: 18.w,
                                  decoration: BoxDecoration(
                                    color: d.isOnline
                                        ? const Color(0xFF22C55E)
                                        : const Color(0xFF9CA3AF),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFF3F4F6),
                                      width: 4.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(width: 14.w),

                          // ✅ Text area (center aligned vertically)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  d.hospital,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF2563EB),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  d.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18.sp, // bigger like screenshot
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  d.specialty,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
