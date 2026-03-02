import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateLoginController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onNext() {
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    if (password.isEmpty || confirm.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    if (password != confirm) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    // 🔥 Only 6 digits allowed
    if (!RegExp(r'^\d{6}$').hasMatch(password)) {
      Get.snackbar("Error", "Password must be exactly 6 digits");
      return;
    }

    // ✅ Navigate next screen
    Get.toNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
