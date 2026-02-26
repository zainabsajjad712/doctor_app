import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top bar (Skip)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: controller.skip,
                    child: Text(
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
                  padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),

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
                                  height: h * 0.27,
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Title
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

                                // Subtitle
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Text(
                                    item.subtitle,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      color: Colors.black.withOpacity(0.65),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 18),

                                // ✅ Indicator NOW with text (same place as screenshot)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 140,
                                  ),
                                  child: Center(
                                    child: OnboardingIndicator(
                                      controller: controller,
                                      // width: 120,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 22),

                      // Bottom button only
                      Obx(() {
                        final isLast =
                            controller.currentIndex.value ==
                            controller.total - 1;

                        return CustomButton(
                          borderRadius: 38,
                          onTap: controller.nextOrFinish,
                          text: isLast ? 'Get Started' : 'Next',
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

/// ✅ No GetView here
class OnboardingIndicator extends StatelessWidget {
  final OnboardingController controller;
  // final double width;

  const OnboardingIndicator({
    super.key,
    required this.controller,
    // required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      // width: width,
      child: Obx(() {
        final selected = controller.currentIndex.value;

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
                width: isActive ? 35 : 8,
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
