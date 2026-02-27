import 'package:doctor_app/src/features/auth/login/login.dart';
import 'package:doctor_app/src/features/auth/login/login_binding.dart';
import 'package:doctor_app/src/features/date/date_binding.dart';
import 'package:doctor_app/src/features/date/date_screen.dart';
import 'package:doctor_app/src/features/auth/otp/otp_binding.dart';
import 'package:doctor_app/src/features/auth/otp/otp_view.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_binding.dart';
import 'package:doctor_app/src/features/auth/phone_verification/phone_view.dart';
import 'package:doctor_app/src/features/doctor_call/doctor_call_binding.dart';
import 'package:doctor_app/src/features/doctor_call/doctor_call_view.dart';
import 'package:doctor_app/src/features/doctor_video_call/doctor_video_call_binding.dart';
import 'package:doctor_app/src/features/doctor_video_call/doctor_video_call_view.dart';
import 'package:doctor_app/src/features/feedback_screen/feedback_binding.dart';
import 'package:doctor_app/src/features/feedback_screen/feedback_view.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_binding.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_view.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_binding.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_view.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_detail/online_consultation_detail_binding.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_detail/online_consultation_detail_view.dart';
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
      name: AppRoutes.onlineConsultation,
      page: () => const OnlineConsultationView(),
      binding: OnlineConsultationBinding(),
    ),
    GetPage(
      name: AppRoutes.onlineConsultationDetails,
      page: () => const OnlineConsultationDetailView(),
      binding: OnlineConsultationDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.doctorCall,
      page: () => const DoctorCallView(),
      binding: DoctorCallBinding(),
    ),
    GetPage(
      name: AppRoutes.doctorVideoCall,
      page: () => const DoctorVideoCallView(),
      binding: DoctorVideoCallBinding(),
    ),
    GetPage(
      name: AppRoutes.feedback,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
  ];
}
