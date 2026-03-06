import 'dart:async';

import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  final isLoading = false.obs;
  Future<void> onNext() async {
    final isValid = formKey2.currentState?.validate() ?? false;
    if (!isValid) return;

    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1)); // demo

      Get.toNamed(AppRoutes.personalInfo);
    } catch (_) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  // !         login controller data
  RxString gender = ''.obs;

  void selectGender(String value) {
    gender.value = value;
  }

  // !        Otp controller
  final RxString phone = ''.obs;

  int otpLength = 6;

  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  final RxBool isOtpLoading = false.obs;

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
        if (isOtpComplete && !isOtpLoading.value) {
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
      colorText: AppColor.white,
    );

    startTimer();
  }

  Future<void> verifyOtp() async {
    if (isOtpLoading.value) return;

    if (!isOtpComplete) return;

    isOtpLoading.value = true;

    await Future.delayed(const Duration(seconds: 1)); // demo delay

    isOtpLoading.value = false;

    Get.offAllNamed(AppRoutes.createPassword);
  }

  void changeNumber() {
    Get.offAllNamed(AppRoutes.email);
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

  // !  ---------------       email controller data --------------------=

  Future<void> onEmailNext() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed(AppRoutes.otp);
    } finally {
      isLoading.value = false;
    }
  }
}
