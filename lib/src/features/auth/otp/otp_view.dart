import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final controller = Get.put(OtpController()); // ✅

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Top icon
              const Icon(
                Icons.phone_android_outlined,
                size: 90,
                color: Colors.black,
              ),
              const SizedBox(height: 22),

              // Title + subtitle
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "OTP authentication",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              Align(
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  return Text(
                    'Enter the verification code sent to ${controller.phone.value}',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 26),

              // OTP inputs
              SizedBox(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(OtpController.otpLength, (i) {
                    return _OtpBox(index: i);
                  }),
                ),
              ),

              const Spacer(),

              // Resend row
              Obx(() {
                final s = controller.secondsLeft.value;
                final canResend = s == 0;

                return Column(
                  children: [
                    Text(
                      canResend
                          ? "Did not receive the OTP code?"
                          : "Did not receive the OTP code? Resend (01:${s.toString().padLeft(2, '0')})",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.65),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),

                    // Resend link
                    GestureDetector(
                      onTap: canResend ? controller.resendOtp : null,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: canResend
                              ? AppColor.primaryButton
                              : Colors.black.withOpacity(0.35),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Change number
                    GestureDetector(
                      onTap: controller.changeNumber,
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
                );
              }),

              const SizedBox(height: 18),

              // Verify button (optional)
              Obx(() {
                return SizedBox(
                  width: w,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              }),

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
