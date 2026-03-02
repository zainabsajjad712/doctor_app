import 'package:doctor_app/src/features/chat/chat_view.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_view.dart';
import 'package:doctor_app/src/features/profile/profile_controller.dart';
import 'package:doctor_app/src/features/search/doctor_controller.dart';
import 'package:doctor_app/src/features/search/doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../features/auth/otp/otp_view.dart';
import '../../features/controllers/navigation_controller.dart';
import '../../features/home/home_view.dart';
import '../../features/online_consultation/online_consultation_controller.dart';
import '../constant/app_colors.dart';

class CustomNavigation extends StatefulWidget {
  final int initialIndex;
  const CustomNavigation({super.key, this.initialIndex = 0});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  final NavigationController navigationCont = Get.put(
    NavigationController(),
    permanent: true,
  );

  final List<double> _turns = List<double>.filled(4, 0.0);
  int? _pressedIndex;

  /// ✅ PAGES
  final List<Widget> _pages = [
    HomeView(), // 0
    DoctorView(), // 1
    ChatScreen(), // 2
    OnlineConsultationView(), // 3 ✅ PROFILE
    const OtpView(), // 4 FAB
  ];

  @override
  void initState() {
    super.initState();

    Get.put(DoctorController(), permanent: true);
    Get.put(ProfileController(), permanent: true);

    // ✅ ADD THIS
    Get.put(OnlineConsultationController(), permanent: true);

    navigationCont.setSelectedIndex(widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return GetBuilder<NavigationController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _pages[value.selectedIndex],
          bottomNavigationBar: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, -6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.home_filled, 0, value),
                    _buildNavItem(Icons.explore, 1, value),
                    const SizedBox(width: 40),
                    _buildNavItem(Icons.chat, 2, value),
                    _buildNavItem(Icons.person, 3, value),
                  ],
                ),
              ),

              /// FAB BUTTON
              Positioned(
                bottom: 25,
                child: GestureDetector(
                  onTap: () {
                    value.setSelectedIndex(4);
                  },
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primaryButton,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryButton.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    NavigationController navigationCont,
  ) {
    final bool isSelected = navigationCont.selectedIndex == index;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressedIndex = index),
      onTapCancel: () => setState(() => _pressedIndex = null),
      onTapUp: (_) => setState(() => _pressedIndex = null),
      onTap: () {
        setState(() => _turns[index] += 1.0);
        navigationCont.setSelectedIndex(index);
      },
      child: AnimatedScale(
        scale: _pressedIndex == index ? 0.90 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: AnimatedRotation(
          turns: _turns[index],
          duration: const Duration(seconds: 1),
          child: Icon(
            icon,
            size: 25.sp,
            color: isSelected ? AppColor.primaryButton : Colors.grey,
          ),
        ),
      ),
    );
  }
}
