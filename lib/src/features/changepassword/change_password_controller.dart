import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var showCurrent = true.obs;
  var showNew = true.obs;
  var showConfirm = true.obs;

  void toggleCurrent() {
    showCurrent.value = !showCurrent.value;
  }

  void toggleNew() {
    showNew.value = !showNew.value;
  }

  void toggleConfirm() {
    showConfirm.value = !showConfirm.value;
  }

  void changePassword() {

    if (formKey.currentState!.validate()) {

      if (newPasswordController.text != confirmPasswordController.text) {

        Get.snackbar(
          "Error",
          "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
        );

        return;
      }

      Get.snackbar(
        "Success",
        "Password changed successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}