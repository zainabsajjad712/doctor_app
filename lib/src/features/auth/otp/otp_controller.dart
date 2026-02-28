import 'dart:async';
import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final RxString phone = ''.obs;

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

  final RxInt secondsLeft = 20.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

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

  bool get isOtpComplete => controllers.every((c) => c.text.trim().length == 1);

  void onDigitChanged(int index, String value) {
    if (value.length > 1) {
      controllers[index].text = value.substring(value.length - 1);
      controllers[index].selection = TextSelection.fromPosition(
        TextPosition(offset: controllers[index].text.length),
      );
    }

    if (value.isNotEmpty) {
      if (index < otpLength - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        FocusManager.instance.primaryFocus?.unfocus();

        /// ✅ AUTO VERIFY HERE
        if (isOtpComplete && !isLoading.value) {
          verifyOtp();
        }
      }
    } else {
      if (index > 0) focusNodes[index - 1].requestFocus();
    }
  }

  Future<void> resendOtp() async {
    if (secondsLeft.value != 0) return;

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
    if (isLoading.value) return;

    if (!isOtpComplete) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1)); // demo delay

    isLoading.value = false;

    Get.offAllNamed(AppRoutes.personalInfo);
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
