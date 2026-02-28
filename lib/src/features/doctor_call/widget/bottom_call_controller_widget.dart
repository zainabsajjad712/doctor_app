import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/features/online_consultation/model/online_consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomCallControls extends StatelessWidget {
  const BottomCallControls({
    super.key,
    required this.doctor,
    required this.micOn,
    required this.videoOn,
    required this.onMic,
    required this.onEnd,
  });

  final DoctorModel doctor;
  final RxBool micOn;
  final RxBool videoOn;
  final VoidCallback onMic;
  final VoidCallback onEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 🎤 MIC
        Obx(
          () => _buildCircle(
            bg: AppColor.white.withAlpha(35),
            //  Colors.white.withOpacity(0.18),
            icon: micOn.value ? Icons.mic : Icons.mic_off,
            onTap: onMic,
          ),
        ),

        SizedBox(width: 20.w),

        /// ❌ END CALL
        _buildCircle(bg: AppColor.redColor, icon: Icons.call_end, onTap: onEnd),

        SizedBox(width: 20.w),

        /// 📹 VIDEO
        Obx(
          () => _buildCircle(
            bg: AppColor.white.withAlpha(35),
            icon: videoOn.value ? Icons.videocam : Icons.videocam_off,
            onTap: () =>
                Get.toNamed(AppRoutes.doctorVideoCall, arguments: doctor),
          ),
        ),
      ],
    );
  }

  Widget _buildCircle({
    required Color bg,
    required IconData icon,
    required VoidCallback onTap,
  }) {
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
