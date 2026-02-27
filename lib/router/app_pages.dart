import 'package:doctor_app/src/features/auth/login/login.dart';
import 'package:doctor_app/src/features/auth/login/login_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_view.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_binding.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_view.dart';
import 'package:doctor_app/src/features/date/date_binding.dart';
import 'package:doctor_app/src/features/date/date_screen.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_binding.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_view.dart';
import 'package:doctor_app/src/features/profile/profile_page.dart';
import 'package:get/get.dart';

import '../src/common/widgets/custom_navigation_bar.dart';
import '../src/features/chat/chat_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.personalInfo,
      page: () => PersonalInfoScreen(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.date,
      page: () => DateScreen(),
      binding: DateBinding(),
    ),
    GetPage(
      name: AppRoutes.phone,
      page: () => const PhoneView(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.customNavigation,
      page: () => const CustomNavigation(),
    ),
    GetPage(
      name: AppRoutes.doctorProfileScreen,
      page: () => DoctorProfileScreen(),
    ),
    GetPage(name: AppRoutes.chatScreen, page: () => ChatScreen()),
  ];
}
