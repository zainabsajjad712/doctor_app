import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final c = Get.find<OtpController>();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppIcons.otp,
                        width: 150.w,
                        height: 150.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 22),

                    const Text(
                      "OTP authentication",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Obx(() {
                      return Text(
                        'Enter the verification code sent to ${c.phone.value}',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.3,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }),

                    const SizedBox(height: 26),

                    SizedBox(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          OtpController.otpLength,
                          (i) => _OtpBox(index: i),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// ✅ Loading indicator (since no button now)
                    Obx(() {
                      if (!c.isLoading.value) {
                        return const SizedBox.shrink();
                      }
                      return const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColor.primaryButton,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              /// Bottom resend + change number
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  children: [
                    Obx(() {
                      final s = c.secondsLeft.value;
                      final canResend = s == 0;

                      final mm = (s ~/ 60).toString().padLeft(2, '0');
                      final ss = (s % 60).toString().padLeft(2, '0');

                      return RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: Colors.black.withOpacity(0.65),
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            const TextSpan(
                              text: "Did not receive the OTP code? ",
                            ),
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: canResend
                                    ? AppColor.primaryButton
                                    : Colors.black.withOpacity(0.35),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = canResend ? c.resendOtp : null,
                            ),
                            if (!canResend)
                              TextSpan(
                                text: " ($mm:$ss)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.45),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 14),

                    GestureDetector(
                      onTap: c.changeNumber,
                      child: Text(
                        "Sign in with another phone number",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends GetView<OtpController> {
  final int index;
  const _OtpBox({required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      child: TextField(
        controller: controller.controllers[index],
        focusNode: controller.focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.25),
              width: 2,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryButton, width: 2),
          ),
        ),
        onChanged: (v) => controller.onDigitChanged(index, v),
      ),
    );
  }
}
