import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> onNext() async {
    // ✅ Only validators decide field errors
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    isLoading.value = true;
    try {
      //   final password = passwordController.text.trim();

      // ✅ Real app: password/pin usually saved for later request
      // Example:
      // await authRepo.savePinLocally(password);
      // OR include in final signup payload with other info later.

      await Future.delayed(const Duration(seconds: 1)); // demo

      Get.toNamed(AppRoutes.personalInfo);
    } catch (_) {
      // ✅ snackbar only for API/system error (optional)
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
