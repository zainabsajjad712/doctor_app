import 'package:doctor_app/router/app_routes.dart' show AppRoutes;
import 'package:doctor_app/src/features/auth/otp/otp_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  final phoneController = TextEditingController();

  RxBool isLoading = false.obs;

  String completePhone = '';

  void onPhoneChanged(String number) {
    completePhone = number;
  }

  void onNext() async {
    if (completePhone.isEmpty) {
      Get.snackbar('Error', 'Enter phone number');
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    Get.to(
      () => const OtpView(),
      binding: OtpBinding(),
      arguments: {"phone": completePhone},
    );
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
