import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/features/online_consultation/model/online_consultation_model.dart';
import 'package:doctor_app/src/features/online_consultation/widget/doctor_stats_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.d,
    this.onTap,
    this.showStats = false,
    this.margin,
  });

  final DoctorModel d;
  final VoidCallback? onTap;
  final bool showStats;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin ?? EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8.r),
      //   // border: Border.all(color: const Color(0xFFE5E7EB)),
      //   boxShadow: [
      //     BoxShadow(
      //       blurRadius: 14,
      //       spreadRadius: 0,
      //       offset: const Offset(0, 6),
      //       color: Colors.black.withOpacity(0.05),
      //     ),
      //   ],
      // ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              Stack(
                children: [
                  Container(
                    width: 84.w, // ✅ size km
                    height: 84.w, // ✅ size km
                    padding: EdgeInsets.all(7.w),
                    decoration: BoxDecoration(
                      color: AppColor.containerBg,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r),

                        // ✅ jis corner ko radius nahi tha usko 5 do
                        topLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                    ),
                    child: ClipRRect(
                      // ✅ SAME corners as container (image bilkul match karegi)
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r),
                        topLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: d.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Center(
                          child: SizedBox(
                            width: 14.w,
                            height: 14.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        errorWidget: (_, __, ___) => Icon(
                          Icons.person,
                          size: 30.sp,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                    ),
                  ),

                  // ✅ online dot (thoda adjust)
                  Positioned(
                    left: 8.w,
                    top: 8.h,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                        color: d.isOnline
                            ? AppColor.greenColor
                            : AppColor.lightGreyTextColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColor.borderColor,
                          width: 4.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 14.w),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      d.hospital,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primaryButton,
                      ),
                    ),
                    Text(
                      d.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      d.specialty,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.lightGreyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (showStats) ...[SizedBox(height: 12.h), DoctorStatsRow(doctor: d)],
        ],
      ),
    );

    if (onTap == null) return card;

    return GestureDetector(
      // borderRadius: BorderRadius.circular(18.r),
      onTap: onTap,
      child: card,
    );
  }
}
