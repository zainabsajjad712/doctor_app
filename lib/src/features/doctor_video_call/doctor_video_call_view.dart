import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'doctor_video_call_controller.dart';

class DoctorVideoCallView extends GetView<DoctorVideoCallController> {
  const DoctorVideoCallView({super.key});

  @override
  Widget build(BuildContext context) {
    final d = controller.doctor;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: ClipRRect(
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: d.imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    Container(color: const Color(0xFF111827)),
                errorWidget: (_, __, ___) =>
                    Container(color: const Color(0xFF111827)),
              ),
            ),

            // ✅ Top bar
            Positioned(
              left: 14.w,
              right: 14.w,
              top: 50.h,
              child: Row(
                children: [
                  _TopIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: Get.back,
                  ),
                  const Spacer(),

                  // doctor name pill
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.containerBg,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.greenColor,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          d.name,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  _TopIconButton(
                    icon: Icons.photo_camera_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // ✅ timer text (center top)
            Positioned(
              top: 90.h,
              left: 0,
              right: 0,
              child: Center(
                child: Obx(() {
                  return Text(
                    controller.timerText,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  );
                }),
              ),
            ),

            // ✅ Self preview tile (bottom right)
            Positioned(
              right: 18.w,
              bottom: 112.h,
              child: Container(
                width: 76.w,
                height: 92.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.55),
                    width: 1,
                  ),
                  color: Colors.white.withOpacity(0.12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    // dummy self preview (later camera feed)
                    "https://i.pravatar.cc/200?img=12",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(),
                  ),
                ),
              ),
            ),

            // ✅ Bottom controls
            Positioned(
              left: 0,
              right: 0,
              bottom: 28.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return _CircleControl(
                      bg: AppColor.white.withAlpha(35),

                      icon: controller.micOn.value ? Icons.mic : Icons.mic_off,
                      onTap: controller.toggleMic,
                    );
                  }),
                  SizedBox(width: 22.w),
                  _CircleControl(
                    bg: AppColor.redColor,
                    icon: Icons.call_end,
                    onTap: controller.endCall,
                  ),
                  SizedBox(width: 22.w),
                  Obx(() {
                    return _CircleControl(
                      bg: AppColor.white.withAlpha(35),

                      icon: controller.camOn.value
                          ? Icons.videocam
                          : Icons.videocam_off,
                      onTap: controller.toggleCam,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopIconButton extends StatelessWidget {
  const _TopIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        width: 34.w,
        height: 34.w,
        decoration: BoxDecoration(
          color: AppColor.containerBg,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18.sp, color: Colors.white),
      ),
    );
  }
}

class _CircleControl extends StatelessWidget {
  const _CircleControl({
    required this.bg,
    required this.icon,
    required this.onTap,
  });

  final Color bg;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        width: 54.w,
        height: 54.w,
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 22.sp),
      ),
    );
  }
}
