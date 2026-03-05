import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> onNext() async {
    // ✅ Only ONE validation source: Form validator
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    isLoading.value = true;

    try {
      // ✅ Here you will call API for OTP
      // await authRepo.sendOtp(emailController.text.trim());

      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed(AppRoutes.otp);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
