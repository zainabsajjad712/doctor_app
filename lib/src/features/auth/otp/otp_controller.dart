import 'dart:async';
import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // Phone comes from previous screen:
  // Get.toNamed(AppRoutes.otp, arguments: {"phone": "+92336..."});
  final RxString phone = ''.obs;

  // 6-digit OTP
  static const int otpLength = 6;
  final List<TextEditingController> controllers = List.generate(
    otpLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    otpLength,
    (_) => FocusNode(),
  );

  final RxBool isLoading = false.obs;

  // Timer (resend)
  final RxInt secondsLeft = 20.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    // receive phone from args
    final args = Get.arguments;
    if (args is Map && args["phone"] != null) {
      phone.value = args["phone"].toString();
    }

    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    secondsLeft.value = 20;

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 1) {
        secondsLeft.value = 0;
        t.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }

  String get otpCode => controllers.map((c) => c.text.trim()).join();

  bool get isOtpComplete =>
      otpCode.length == otpLength && !otpCode.contains('');

  void onDigitChanged(int index, String value) {
    // keep only last digit
    if (value.length > 1) {
      controllers[index].text = value.substring(value.length - 1);
      controllers[index].selection = TextSelection.fromPosition(
        TextPosition(offset: controllers[index].text.length),
      );
    }

    if (value.isNotEmpty) {
      // move next
      if (index < otpLength - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        FocusManager.instance.primaryFocus?.unfocus();
        // optional auto verify if complete
        // if (isOtpComplete) verifyOtp();
      }
    } else {
      // back
      if (index > 0) focusNodes[index - 1].requestFocus();
    }
  }

  Future<void> resendOtp() async {
    if (secondsLeft.value != 0) return;

    // ✅ Future API call place (not adding now)
    // isLoading.value = true;
    // await repo.resendOtp(phone.value);
    // isLoading.value = false;

    Get.snackbar(
      "OTP",
      "Code resent to ${phone.value}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );

    startTimer();
  }

  Future<void> verifyOtp() async {
    if (!isOtpComplete) {
      Get.snackbar(
        "Error",
        "Please enter complete OTP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
      );
      return;
    }

    // ✅ Future API call place (not adding now)
    // isLoading.value = true;
    // final ok = await repo.verifyOtp(phone.value, otpCode);
    // isLoading.value = false;

    // For now (demo success)
    Get.offAllNamed(AppRoutes.home);
  }

  void changeNumber() {
    Get.offAllNamed(AppRoutes.phone);
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
