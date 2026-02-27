import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:doctor_app/src/features/online_consultation/model/online_consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorStatsRow extends StatelessWidget {
  const DoctorStatsRow({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColor.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(
              iconPath: AppIcons.verify,
              title: doctor.isVerified ? "Verified" : "Not Verified",
              sub: "Certification",
            ),
          ),
          Container(
            width: 1.w,
            height: 36.h, // taller like screenshot
            color: AppColor.borderColor,
          ),
          Expanded(
            child: _StatItem(
              iconPath: AppIcons.briefcase,
              title: "${doctor.experienceYears} Years",
              sub: "Experience",
            ),
          ),
          Container(
            width: 1.w,
            height: 36.h, // taller like screenshot
            color: AppColor.borderColor,
          ),
          Expanded(
            child: _StatItem(
              iconPath: AppIcons.star,
              title: doctor.rating.toStringAsFixed(1),
              sub: "Rating",
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.iconPath,
    required this.title,
    required this.sub,
  });

  final String iconPath;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColor.primaryButton,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          sub,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.lightGreyTextColor,
          ),
        ),
      ],
    );
  }
}
