import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_detail/online_consultation_detail_controller.dart';
import 'package:doctor_app/src/features/online_consultation/widget/call_note_dialoge.dart';
import 'package:doctor_app/src/features/online_consultation/widget/custom_doctor_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnlineConsultationDetailView
    extends GetView<OnlineConsultationDetailController> {
  const OnlineConsultationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final d = controller.doctor;

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: AppColor.containerBg,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(AppIcons.save),
              ),
            ),
          ),
        ],
      ),

      // ✅ CONTENT SCROLL
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          padding: EdgeInsets.only(bottom: 110.h), // ✅ space for bottom button
          children: [
            DoctorCard(d: d, showStats: true, margin: EdgeInsets.zero),
            SizedBox(height: 18.h),
            Text(
              "About",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: AppColor.borderColor),
              ),
              child: Text(
                d.about.isNotEmpty
                    ? d.about
                    : "No details available at the moment.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.lightGreyTextColor,
                  height: 1.6,
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ActionSquareButton(
                  iconPath: AppIcons.mail,
                  onTap: () {
                    if (!d.hasEmail) {
                      Get.snackbar("Email", "Doctor email not available");
                      return;
                    }
                  },
                ),
                SizedBox(width: 16.w),
                _ActionSquareButton(
                  iconPath: AppIcons.message,
                  onTap: () {
                    if (!d.canChat) {
                      Get.snackbar(
                        "Chat",
                        "Chat is not available for this doctor",
                      );
                      return;
                    }
                    Get.toNamed(AppRoutes.chatScreen, arguments: d);
                  },
                ),
                SizedBox(width: 16.w),

                // ✅ CALL ICON -> shows dialog
                // _ActionSquareButton(
                //   iconPath: AppIcons.call,
                //   onTap: () {
                //     Get.dialog(
                //       CallNoteDialog(
                //         title: "Note",
                //         message:
                //             "The call will end automatically after 15 minutes",
                //         confirmText: "Confirm",
                //         onConfirm: () {
                //           Get.back(); // close dialog
                //         },
                //       ),
                //       barrierDismissible: true,
                //     );
                //   },
                // ),
                _ActionSquareButton(
                  iconPath: AppIcons.call,
                  onTap: () {
                    if (!d.canCall || !d.hasPhone) {
                      Get.snackbar(
                        "Call",
                        "Call is not available for this doctor",
                      );
                      return;
                    }

                    Get.dialog(
                      CallNoteDialog(
                        title: "Note",
                        message:
                            "The call will end automatically after 15 minutes",
                        confirmText: "Confirm",
                        onConfirm: () {
                          Get.back();
                          Get.toNamed(
                            AppRoutes.doctorCall,
                            arguments: d,
                          ); // ✅ pass doctor
                        },
                      ),
                      barrierDismissible: true,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),

      // ✅ FIXED BOTTOM BUTTON
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 14.h),
          child: CustomButton(
            text: "Call the doctor",
            borderRadius: 25.r,
            onTap: () {
              //  Get.back(); // close dialog
              Get.toNamed(
                AppRoutes.doctorCall,
                arguments: d,
              ); // ✅ pass doctor data
            },
          ),
        ),
      ),
    );
  }
}

class _ActionSquareButton extends StatelessWidget {
  const _ActionSquareButton({required this.iconPath, required this.onTap});

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: onTap,
      child: Container(
        width: 54.w,
        height: 54.w,
        decoration: BoxDecoration(
          color: AppColor.primaryButton, // ✅ same blue
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 22.w,
            height: 22.w,
            colorFilter: const ColorFilter.mode(
              AppColor.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
