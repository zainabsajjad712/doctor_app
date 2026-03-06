import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/features/doctor_call/widget/bottom_call_controller_widget.dart';
import 'package:doctor_app/src/features/doctor_call/widget/pulsing_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'doctor_call_controller.dart';

class DoctorCallView extends GetView<DoctorCallController> {
  const DoctorCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryButton,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),

              Text(
                controller.doctor.name,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.white,
                ),
              ),
              SizedBox(height: 6.h),
              Obx(() {
                return Text(
                  controller.statusText.value,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white.withAlpha(200),
                  ),
                );
              }),

              SizedBox(height: 40.h),

              // ✅ Animated rings + image
              Expanded(
                child: Center(
                  child: PulsingAvatar(imageUrl: controller.doctor.imageUrl),
                ),
              ),

              // ✅ Bottom controls
              SizedBox(height: 18.h),
              BottomCallControls(
                onMic: controller.toggleMic,
                onEnd: controller.endCall,
                //  onVideo: controller.toggleVideo,
                micOn: controller.micOn,
                videoOn: controller.videoOn,
                doctor: controller.doctor, // ✅ pass doctor data
              ),
              SizedBox(height: 28.h),
            ],
          ),
        ),
      ),
    );
  }
}
