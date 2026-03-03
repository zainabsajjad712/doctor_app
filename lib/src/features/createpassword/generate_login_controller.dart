import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateLoginController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // void onNext() {
  //   if (passwordController.text.isEmpty ||
  //       confirmPasswordController.text.isEmpty) {
  //     Get.snackbar("Error", "Please fill all fields");
  //     return;
  //   }

  //   if (passwordController.text != confirmPasswordController.text) {
  //     Get.snackbar("Error", "Passwords do not match");
  //     return;
  //   }

  //   if (passwordController.text.length != 6) {
  //     Get.snackbar("Error", "Password must be 6 digits");
  //     return;
  //   }

  //   // // ✅ Navigate next screen
  //   // Get.toNamed('/home');
  // }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}