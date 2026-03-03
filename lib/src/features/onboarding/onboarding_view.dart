import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top bar (Skip)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
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
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: AppColor.white,
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
                                  height: 150.h,
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 20.h),

                                // Title
                                Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Subtitle
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.w,
                                  ),
                                  child: Text(
                                    item.subtitle,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      height: 1.4,
                                      color: Colors.black.withOpacity(0.65),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 18.h),

                                // ✅ Indicator NOW with text (same place as screenshot)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 140.w,
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

                      SizedBox(height: 22.h),

                      // Bottom button only
                      Obx(() {
                        final isLast =
                            controller.currentIndex.value ==
                            controller.total - 1;

                        return CustomButton(
                          borderRadius: 38.r,
                          onTap: controller.nextOrFinish,
                          text: isLast ? 'Get Started' : 'Next',
                        );
                      }),

                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h),
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
      height: 10.h,
      child: Obx(() {
        final selected = controller.currentIndex.value;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.total,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            final isActive = selected == index;
            return GestureDetector(
              onTap: () => controller.goToPage(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 6.h,
                width: isActive ? 30.w : 8.w,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColor.primaryButton
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
