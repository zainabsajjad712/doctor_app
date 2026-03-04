import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailController extends GetxController {
  final emailController = TextEditingController();

  RxBool isLoading = false.obs;

  void onNext() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar('Error', 'Enter email');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Enter valid email');
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // next screen
    Get.toNamed(AppRoutes.otp);
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
