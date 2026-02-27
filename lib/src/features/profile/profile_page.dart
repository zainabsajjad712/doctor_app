import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import 'profile_controller.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final data = controller.doctor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.4),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.bookmarks_outlined, size: 18.sp),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 85.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.r),
                                  image: DecorationImage(
                                    image: NetworkImage(data.doctorImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (data.isOnline)
                                Positioned(
                                  left: 6.w,
                                  top: 6.h,
                                  child: Container(
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.hospitalName,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColor.primaryButton,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    data.doctorName,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    data.specialty,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14.h),

                      // Stats box (same UI)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _infoChip(
                                icon: Icons.verified_rounded,
                                title: "Verify",
                                subtitle: "Certified",
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              child: VerticalDivider(
                                color: const Color(0xFFE2E8F0),
                                thickness: 1.5.w,
                                width: 20.w,
                              ),
                            ),
                            Expanded(
                              child: _infoChip(
                                icon: Icons.badge_outlined,
                                title: "${data.experience} Years",
                                subtitle: "Experience",
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              child: VerticalDivider(
                                color: const Color(0xFFE2E8F0),
                                thickness: 1.5.w,
                                width: 20.w,
                              ),
                            ),
                            Expanded(
                              child: _infoChip(
                                icon: Icons.star_rounded,
                                title: data.rating.toStringAsFixed(1),
                                subtitle: "Rating",
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Price row
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: data.price,
                                  style: TextStyle(
                                    color: const Color(0xFFFF5050),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: "\n${data.priceUnit}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColor.primaryButton
                                  .withOpacity(0.1),
                              side: BorderSide(
                                color: AppColor.primaryButton,
                                width: 1.4.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 26.w,
                                vertical: 12.h,
                              ),
                            ),
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                color: AppColor.primaryButton,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      // Review card (same UI)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(
                                color: Color(0xFFE2E8F0),
                                thickness: 0.8.w,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data.review.userImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.review.userName,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        data.review.timeAgo,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber.withOpacity(0.1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          size: 16.sp,
                                          color: const Color(0xFFF59E0B),
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          data.review.rating.toStringAsFixed(1),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: const Color(0xFFF59E0B),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              data.review.comment,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xFF475569),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(
                                color: Color(0xFFE2E8F0),
                                thickness: 0.8.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              CustomButton(onTap: () {}, text: 'Book an appointment'),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoChip({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20.sp, color: AppColor.primaryButton),
            SizedBox(width: 2.w),
            Text(
              title,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          subtitle,
          style: TextStyle(fontSize: 11.sp, color: Colors.black54),
        ),
      ],
    );
  }
}
