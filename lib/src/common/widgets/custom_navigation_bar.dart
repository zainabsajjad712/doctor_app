// // import 'package:doctor_app/src/features/home/home_view.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';

// // import '../../features/auth/otp/otp_view.dart';
// // import '../../features/controllers/navigation_controller.dart';
// // import '../constant/app_colors.dart';

// // class CustomNavigation extends StatefulWidget {
// //   final int initialIndex;
// //   const CustomNavigation({super.key, this.initialIndex = 0});

// //   @override
// //   _CustomNavigationState createState() => _CustomNavigationState();
// // }

// // class _CustomNavigationState extends State<CustomNavigation> {
// //   final navigationCont = Get.put(NavigationController());

// //   // NEW: per-tab rotation turns (0..3 for the four nav icons)
// //   final List<double> _turns = List<double>.filled(4, 0.0);
// //   // NEW: press state for tiny bounce
// //   int? _pressedIndex;

// //   static final List<Widget> _widgetOptions = <Widget>[
// //     const HomeView(),
// //     HomeView(),
// //     OtpView(),
// //     OtpView(),
// //     OtpView(),

// //     // Placeholder for Floating Button
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();

// //     WidgetsBinding.instance.addPostFrameCallback((_) {});
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       final args = ModalRoute.of(context)?.settings.arguments;

// //       int indexToSet = widget.initialIndex;

// //       if (args is Map<String, dynamic> && args.containsKey('index')) {
// //         final indexArg = args['index'];
// //         if (indexArg is int) {
// //           indexToSet = indexArg;
// //         }
// //       }

// //       navigationCont.setSelectedIndex(indexToSet);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final double height = MediaQuery.of(context).size.height;
// //     return GetBuilder<NavigationController>(
// //       builder: (value) {
// //         return Scaffold(
// //           backgroundColor: AppColor.white,
// //           body: _widgetOptions[value.selectedIndex],
// //           bottomNavigationBar: Padding(
// //             padding: EdgeInsets.only(
// //               bottom: MediaQuery.of(context).viewPadding.bottom,
// //             ),
// //             child: Stack(
// //               alignment: Alignment.center,
// //               clipBehavior: Clip.none,
// //               children: [
// //                 ClipPath(
// //                   clipper: CenterNotchClipper(
// //                     notchRadius: 32, // FAB size ke hisaab se adjust
// //                     notchDepth: -1, // cut depth
// //                     smooth: 30, // smoothness
// //                   ),
// //                   child: Container(
// //                     height: height * 0.098,
// //                     decoration: BoxDecoration(
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.15),
// //                           blurRadius: 12.r,
// //                           spreadRadius: 0,
// //                           offset: Offset(0, -6),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                       children: [
// //                         _buildNavItem(Icons.home_filled, 'Home', 0, value),
// //                         _buildNavItem(
// //                           Icons.access_time_filled_sharp,
// //                           'Explore',
// //                           1,
// //                           value,
// //                         ),
// //                         const SizedBox(width: 40), // FAB space
// //                         _buildNavItem(Icons.chat_outlined, 'Chat', 2, value),
// //                         _buildNavItem(Icons.settings, 'Profile', 3, value),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: height * 0.06,
// //                   child: IconButton(
// //                     enableFeedback: false,
// //                     onPressed: () {
// //                       value.setSelectedIndex(4);
// //                     },
// //                     icon: Stack(
// //                       alignment: Alignment.center,
// //                       children: [
// //                         Container(
// //                           height: 55.h,
// //                           width: 55.w,
// //                           decoration: BoxDecoration(
// //                             shape: BoxShape.circle,
// //                             color: AppColor.primaryButton,
// //                             boxShadow: [
// //                               BoxShadow(
// //                                 color: AppColor.primaryButton.withOpacity(0.4),
// //                                 blurRadius: 10,
// //                                 spreadRadius: 4,
// //                                 offset: Offset(0, 0),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         Container(
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(5),
// //                             color: AppColor.white,
// //                           ),
// //                           child: Padding(
// //                             padding: EdgeInsets.all(3.9.sp),
// //                             child: Icon(
// //                               Icons.add,
// //                               color: AppColor.primaryButton,
// //                               size: 16.sp,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   // icon tap: 360° rotate (1s) + light bounce; everything else unchanged
// //   Widget _buildNavItem(
// //     IconData icon,
// //     String label,
// //     int index,
// //     NavigationController navigationCont,
// //   ) {
// //     final bool isSelected = navigationCont.selectedIndex == index;

// //     return GestureDetector(
// //       onTapDown: (_) => setState(() => _pressedIndex = index),
// //       onTapCancel: () => setState(() => _pressedIndex = null),
// //       onTapUp: (_) => setState(() => _pressedIndex = null),
// //       onTap: () {
// //         // spin only for the 4 nav icons (indices 0..3)
// //         if (index >= 0 && index < _turns.length) {
// //           setState(() => _turns[index] += 1.0); // +1 turn = 360°
// //         }
// //         navigationCont.setSelectedIndex(index);
// //       },
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 200),
// //         curve: Curves.easeOut,
// //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             // bounce on press + rotation on tap
// //             AnimatedScale(
// //               scale: _pressedIndex == index ? 0.90 : 1.0,
// //               duration: const Duration(milliseconds: 140),
// //               curve: Curves.easeOutBack,
// //               child: AnimatedRotation(
// //                 turns: (index >= 0 && index < _turns.length)
// //                     ? _turns[index]
// //                     : 0.0,
// //                 duration: const Duration(seconds: 1),
// //                 curve: Curves.easeInOut,
// //                 child: Icon(
// //                   icon,
// //                   size: 25.sp,
// //                   color: isSelected
// //                       ? AppColor.primaryButton
// //                       : Colors.grey.withOpacity(0.5),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   TextStyle selectedTextStyle() {
// //     return TextStyle(
// //       color: AppColor.primaryButton,
// //       fontSize: 12,
// //       fontWeight: FontWeight.w500,
// //     );
// //   }

// //   TextStyle unselectedTextStyle() {
// //     return const TextStyle(
// //       color: Colors.grey,
// //       fontSize: 11,
// //       fontWeight: FontWeight.w500,
// //     );
// //   }
// // }

// // class CenterNotchClipper extends CustomClipper<Path> {
// //   final double notchRadius; // cut ka size
// //   final double notchDepth; // cut kitna niche jayega
// //   final double smooth; // curve smoothness

// //   CenterNotchClipper({
// //     this.notchRadius = 34,
// //     this.notchDepth = 22,
// //     this.smooth = 18,
// //   });

// //   @override
// //   Path getClip(Size size) {
// //     final w = size.width;
// //     final h = size.height;
// //     final c = w / 2;

// //     final r = notchRadius;
// //     final d = notchDepth;
// //     final s = smooth;

// //     final path = Path()
// //       ..moveTo(0, 0)
// //       ..lineTo(c - r - s, 0)
// //       // left curve down into notch
// //       ..quadraticBezierTo(c - r, 0, c - r, d)
// //       // notch arc (concave)
// //       ..arcToPoint(
// //         Offset(c + r, d),
// //         radius: Radius.circular(r),
// //         clockwise: false,
// //       )
// //       // right curve back to top
// //       ..quadraticBezierTo(c + r, 0, c + r + s, 0)
// //       ..lineTo(w, 0)
// //       ..lineTo(w, h)
// //       ..lineTo(0, h)
// //       ..close();

// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(covariant CenterNotchClipper oldClipper) {
// //     return oldClipper.notchRadius != notchRadius ||
// //         oldClipper.notchDepth != notchDepth ||
// //         oldClipper.smooth != smooth;
// //   }
// // }
// import 'package:doctor_app/src/features/auth/login/login.dart';
// import 'package:doctor_app/src/features/search/doctor_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../features/home/home_view.dart';
// import '../../features/auth/otp/otp_view.dart';
// import '../../features/controllers/navigation_controller.dart';
// import '../constant/app_colors.dart';

// class CustomNavigation extends StatefulWidget {
//   final int initialIndex;
//   const CustomNavigation({super.key, this.initialIndex = 0});

//   @override
//   State<CustomNavigation> createState() => _CustomNavigationState();
// }

// class _CustomNavigationState extends State<CustomNavigation> {
//   final NavigationController navigationCont =
//       Get.put(NavigationController());

//   final List<double> _turns = List<double>.filled(4, 0.0);
//   int? _pressedIndex;

//   /// ✅ FIXED WIDGET LIST
//   final List<Widget> _pages = [
//     HomeView(), // 0 - Home
//     DoctorView(),  // 1 - Explore
//     PersonalInfoScreen(),  // 2 - Chat
//      OtpView(),  // 3 - Profile
//      OtpView(),  // 4 - FAB
//   ];

//   @override
//   void initState() {
//     super.initState();
//     navigationCont.setSelectedIndex(widget.initialIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;

//     return GetBuilder<NavigationController>(
//       builder: (value) {
//         return Scaffold(
//           backgroundColor: AppColor.white,
//           body: _pages[value.selectedIndex], // ✅ working body
//           bottomNavigationBar: Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 height: height * 0.09,
//                 decoration: BoxDecoration(
//                   color: AppColor.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.15),
//                       blurRadius: 12,
//                       offset: const Offset(0, -6),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildNavItem(Icons.home_filled, 0, value),
//                     _buildNavItem(Icons.explore, 1, value),
//                     const SizedBox(width: 40),
//                     _buildNavItem(Icons.chat, 2, value),
//                     _buildNavItem(Icons.person, 3, value),
//                   ],
//                 ),
//               ),

//               /// FAB BUTTON
//               Positioned(
//                 bottom: 25,
//                 child: GestureDetector(
//                   onTap: () {
//                     value.setSelectedIndex(4);
//                   },
//                   child: Container(
//                     height: 60.h,
//                     width: 60.w,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColor.primaryButton,
//                       boxShadow: [
//                         BoxShadow(
//                           color:
//                               AppColor.primaryButton.withOpacity(0.4),
//                           blurRadius: 10,
//                           spreadRadius: 4,
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.add,
//                       color: AppColor.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildNavItem(
//       IconData icon,
//       int index,
//       NavigationController navigationCont,
//       ) {
//     final bool isSelected = navigationCont.selectedIndex == index;

//     return GestureDetector(
//       onTapDown: (_) => setState(() => _pressedIndex = index),
//       onTapCancel: () => setState(() => _pressedIndex = null),
//       onTapUp: (_) => setState(() => _pressedIndex = null),
//       onTap: () {
//         setState(() => _turns[index] += 1.0);
//         navigationCont.setSelectedIndex(index);
//       },
//       child: AnimatedScale(
//         scale: _pressedIndex == index ? 0.90 : 1.0,
//         duration: const Duration(milliseconds: 150),
//         child: AnimatedRotation(
//           turns: _turns[index],
//           duration: const Duration(seconds: 1),
//           child: Icon(
//             icon,
//             size: 25.sp,
//             color: isSelected
//                 ? AppColor.primaryButton
//                 : Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:doctor_app/src/features/auth/login/login.dart';
// import 'package:doctor_app/src/features/profile/profile_view.dart';
// import 'package:doctor_app/src/features/search/doctor_view.dart';
// import 'package:doctor_app/src/features/search/doctor_controller.dart'; // ✅ ADD THIS
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../features/home/home_view.dart';
// import '../../features/auth/otp/otp_view.dart';
// import '../../features/controllers/navigation_controller.dart';
// import '../constant/app_colors.dart';

// class CustomNavigation extends StatefulWidget {
//   final int initialIndex;
//   const CustomNavigation({super.key, this.initialIndex = 0});

//   @override
//   State<CustomNavigation> createState() => _CustomNavigationState();
// }

// class _CustomNavigationState extends State<CustomNavigation> {
//   final NavigationController navigationCont = Get.put(NavigationController());

//   final List<double> _turns = List<double>.filled(4, 0.0);
//   int? _pressedIndex;

//   /// ✅ PAGES
//   final List<Widget> _pages = [
//     HomeView(), // 0 - Home
//     DoctorView(), // 1 - Explore
//     PersonalInfoScreen(), // 2 - Chat
//     ProfileView(), // 3 - Profile
//     const OtpView(), // 4 - FAB
//   ];

//   @override
//   void initState() {
//     super.initState();

//     /// ✅ IMPORTANT FIX (Controller put here)
//     Get.put(DoctorController(), permanent: true);

//     navigationCont.setSelectedIndex(widget.initialIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;

//     return GetBuilder<NavigationController>(
//       builder: (value) {
//         return Scaffold(
//           backgroundColor: AppColor.white,
//           body: _pages[value.selectedIndex],
//           bottomNavigationBar: Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 height: height * 0.09,
//                 decoration: BoxDecoration(
//                   color: AppColor.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.15),
//                       blurRadius: 12,
//                       offset: const Offset(0, -6),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildNavItem(Icons.home_filled, 0, value),
//                     _buildNavItem(Icons.explore, 1, value),
//                     const SizedBox(width: 40),
//                     _buildNavItem(Icons.chat, 2, value),
//                     _buildNavItem(Icons.person, 3, value),
//                   ],
//                 ),
//               ),

//               Positioned(
//                 bottom: 25,
//                 child: GestureDetector(
//                   onTap: () {
//                     value.setSelectedIndex(4);
//                   },
//                   child: Container(
//                     height: 60.h,
//                     width: 60.w,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColor.primaryButton,
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColor.primaryButton.withOpacity(0.4),
//                           blurRadius: 10,
//                           spreadRadius: 4,
//                         ),
//                       ],
//                     ),
//                     child: const Icon(Icons.add, color: AppColor.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildNavItem(
//     IconData icon,
//     int index,
//     NavigationController navigationCont,
//   ) {
//     final bool isSelected = navigationCont.selectedIndex == index;

//     return GestureDetector(
//       onTapDown: (_) => setState(() => _pressedIndex = index),
//       onTapCancel: () => setState(() => _pressedIndex = null),
//       onTapUp: (_) => setState(() => _pressedIndex = null),
//       onTap: () {
//         setState(() => _turns[index] += 1.0);
//         navigationCont.setSelectedIndex(index);
//       },
//       child: AnimatedScale(
//         scale: _pressedIndex == index ? 0.90 : 1.0,
//         duration: const Duration(milliseconds: 150),
//         child: AnimatedRotation(
//           turns: _turns[index],
//           duration: const Duration(seconds: 1),
//           child: Icon(
//             icon,
//             size: 25.sp,
//             color: isSelected ? AppColor.primaryButton : Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:doctor_app/src/features/auth/login/login.dart';
import 'package:doctor_app/src/features/profile/profile_view.dart';
import 'package:doctor_app/src/features/profile/profile_controller.dart';
import 'package:doctor_app/src/features/search/doctor_view.dart';
import 'package:doctor_app/src/features/search/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../features/home/home_view.dart';
import '../../features/auth/otp/otp_view.dart';
import '../../features/controllers/navigation_controller.dart';
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
    PersonalInfoScreen(), // 2
    ProfileView(), // 3 ✅ PROFILE
    const OtpView(), // 4 FAB
  ];

  @override
  void initState() {
    super.initState();

    /// ✅ CONTROLLERS YAHAN INJECT KARO
    Get.put(DoctorController(), permanent: true);
    Get.put(ProfileController(), permanent: true); // ⭐ IMPORTANT

    navigationCont.setSelectedIndex(widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return GetBuilder<NavigationController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: _pages[value.selectedIndex],
          bottomNavigationBar: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height * 0.09,
                decoration: BoxDecoration(
                  color: AppColor.white,
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
                    child: const Icon(Icons.add, color: AppColor.white),
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
