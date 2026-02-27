import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  // ✅ Flexible data (change images/text here)
  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppImages.onboarding,
      title: 'Easy appointment booking',
      subtitle: 'Book with confidence - Easy to Cuse\n-Quick operation',
    ),
    OnboardingModel(
      image: AppImages.onboardingScnd,
      title: 'Profile security',
      subtitle: 'Keep a careful record of your\n examination.',
    ),
    OnboardingModel(
      image: AppImages.onboardingQuick,
      title: 'Quick action',
      subtitle:
          'Make an opointment at any time\nand from any location. Operation is\nsimple.',
    ),
  ];

  int get total => pages.length;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void skip() {
    Get.offAllNamed(AppRoutes.phone);
  }

  void nextOrFinish() {
    final isLast = currentIndex.value == total - 1;

    if (isLast) {
      Get.offAllNamed(AppRoutes.phone);
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
