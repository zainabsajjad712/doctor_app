import 'package:doctor_app/src/common/widgets/custom_navigation_bar.dart';
import 'package:doctor_app/src/features/appointment/appointment_binding.dart';
import 'package:doctor_app/src/features/appointment/appointment_view.dart';
import 'package:doctor_app/src/features/auth/login/login.dart';
import 'package:doctor_app/src/features/auth/login/login_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_view.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_binding.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_view.dart';
import 'package:doctor_app/src/features/filter/filter_binding.dart';
import 'package:doctor_app/src/features/filter/filter_view.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_binding.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_view.dart';
import 'package:doctor_app/src/features/profile/profile_binding.dart';
import 'package:doctor_app/src/features/profile/profile_view.dart';
import 'package:doctor_app/src/features/reviews/review_binding.dart';
import 'package:doctor_app/src/features/reviews/review_view.dart';
import 'package:doctor_app/src/features/search/doctor_binding.dart';
import 'package:doctor_app/src/features/search/doctor_view.dart';
import 'package:get/get.dart';
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
    // GetPage(
    //   name: AppRoutes.date,
    //   page: () => DateScreen(),
    //   binding: DateBinding(),
    // ),
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
      name: AppRoutes.doctor,
      page: () => DoctorView(),
      binding: DoctorBinding(),
    ),
    GetPage(name: AppRoutes.homescreen, page: () => const CustomNavigation()),
    GetPage(
      name: '/profile',
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    /// ✅ Reviews Screen
    GetPage(
      name: AppRoutes.reviews,
      page: () => const ReviewsView(),
      binding: ReviewsBinding(),
    ),

    /// ✅ Appointment Screen
    GetPage(
      name: AppRoutes.appointment,
      page: () => const AppointmentView(),
      binding: AppointmentBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.customNavigation,
    //   page: () => const CustomNavigation(),
    // ),
  ];
}
