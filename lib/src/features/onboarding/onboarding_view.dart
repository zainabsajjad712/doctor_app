import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar (Skip)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: controller.skip,
                    child: const Text(
                      'skip',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      // PageView
                      Expanded(
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: controller.total,
                          onPageChanged: controller.onPageChanged,
                          itemBuilder: (context, index) {
                            final item = controller.pages[index];

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: h * 0.32,
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.subtitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    height: 1.4,
                                    color: Colors.black.withOpacity(0.65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ✅ Indicator (controller passed)
                      OnboardingIndicator(controller: controller, width: w),

                      const SizedBox(height: 18),

                      // Bottom button
                      Obx(() {
                        final isLast =
                            controller.currentIndex.value ==
                            controller.total - 1;

                        return SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: controller.nextOrFinish,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  OnboardingController.primaryButton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              isLast ? 'Get Started' : 'Next',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),

                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

/// ✅ No GetView here (avoids controller lookup issues)
class OnboardingIndicator extends StatelessWidget {
  final OnboardingController controller;
  final double width;

  const OnboardingIndicator({
    super.key,
    required this.controller,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 120,
      child: Obx(() {
        final selected = controller.currentIndex.value; // ✅ Rx used

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.total,
          itemBuilder: (context, index) {
            final isActive = selected == index;

            return GestureDetector(
              onTap: () => controller.goToPage(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: isActive ? 28 : 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? OnboardingController.primaryButton
                      : Colors.black.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
