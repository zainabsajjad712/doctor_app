import 'package:doctor_app/src/features/auth/login/login.dart';
import 'package:doctor_app/src/features/auth/login/login_binding.dart';
import 'package:doctor_app/src/features/date/date_binding.dart';
import 'package:doctor_app/src/features/date/date_screen.dart';
import 'package:doctor_app/src/features/auth/otp/otp_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_view.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_binding.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_view.dart';
import 'package:doctor_app/src/features/filter/filter_binding.dart';
import 'package:doctor_app/src/features/filter/filter_view.dart';
import 'package:doctor_app/src/features/home/home_binding.dart';
import 'package:doctor_app/src/features/home/home_view.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_binding.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_view.dart';
import 'package:doctor_app/src/features/search/search_binding.dart';
import 'package:doctor_app/src/features/search/search_view.dart';
import 'package:get/get.dart';

import '../src/common/widgets/custom_navigation_bar.dart';
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
      page: () =>  DateScreen(),
      binding: DateBinding(), // 🔥 VERY IMPORTANT
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
      name: AppRoutes.filter,
      page: () => FilterView(),
      binding: FilterBinding(),
    ),
      GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
     GetPage(
  name: AppRoutes.homescreen,
  page: () => const HomeView(),
  binding: HomeBinding(),
),
    GetPage(
      name: AppRoutes.customNavigation,
      page: () => const CustomNavigation(),
    ),
  ];
}
