import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    // ✅ Controller should come from Binding:
    final c = Get.find<OtpController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              // ✅ UPPER SECTION (properly centered)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.phone_android_outlined,
                        size: 140,
                        color: Colors.black,
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

                    // OTP row
                    SizedBox(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(OtpController.otpLength, (i) {
                          return _OtpBox(index: i);
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ BOTTOM TEXTS (thora upar)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Obx(() {
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
                    ),

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

              const SizedBox(height: 18),

              // ✅ Continue button (UNCHANGED)
              Obx(() {
                return SizedBox(
                  width: w,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: c.isLoading.value ? null : c.verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: c.isLoading.value
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
