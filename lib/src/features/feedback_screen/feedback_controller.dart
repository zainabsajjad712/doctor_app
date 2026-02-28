import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final RxInt rating = 0.obs;
  final TextEditingController feedbackCtrl = TextEditingController();

  void setRating(int value) => rating.value = value;

  void onDone() {
    // TODO: later API call
    // rating.value, feedbackCtrl.text
    Get.back(); // or navigate wherever you want
  }

  @override
  void onClose() {
    feedbackCtrl.dispose();
    super.onClose();
  }
}
