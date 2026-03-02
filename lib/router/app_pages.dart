import 'package:doctor_app/src/common/widgets/custom_navigation_bar.dart';
import 'package:doctor_app/src/features/appointment/appointment_binding.dart';
import 'package:doctor_app/src/features/appointment/appointment_view.dart';
import 'package:doctor_app/src/features/attachments/attachments_binding.dart';
import 'package:doctor_app/src/features/attachments/attachments_view.dart';
import 'package:doctor_app/src/features/auth/login/login.dart';
import 'package:doctor_app/src/features/auth/login/login_binding.dart';
import 'package:doctor_app/src/features/auth/login_generate/generate_binding.dart';
import 'package:doctor_app/src/features/auth/login_generate/generate_view.dart';
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
import 'package:doctor_app/src/features/filter/filter_binding.dart';
import 'package:doctor_app/src/features/filter/filter_view.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_binding.dart';
import 'package:doctor_app/src/features/onboarding/onboarding_view.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_binding.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_detail/online_consultation_detail_binding.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_detail/online_consultation_detail_view.dart';
import 'package:doctor_app/src/features/online_consultation/online_consultation_view.dart';
import 'package:doctor_app/src/features/profile/profile_binding.dart'
    hide PhoneBinding;
import 'package:doctor_app/src/features/profile/profile_view.dart';
import 'package:doctor_app/src/features/reviews/review_binding.dart';
import 'package:doctor_app/src/features/reviews/review_view.dart';
import 'package:doctor_app/src/features/search/doctor_binding.dart';
import 'package:doctor_app/src/features/search/doctor_view.dart';
import 'package:doctor_app/src/features/select%20time/time_binding.dart';
import 'package:doctor_app/src/features/select%20time/time_view.dart';
import 'package:get/get.dart';

import '../src/features/chat/chat_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    //zainab Routes
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
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
    /////Mozma Routes Screens
    GetPage(
      name: AppRoutes.personalInfo,
      page: () => PersonalInfoScreen(),
      binding: PersonalInfoBinding(),
    ),

    //
    // GetPage(
    //   name: AppRoutes.date,
    //   page: () => DateScreen(),
    //
    //   binding: DateBinding(),
    // ),

    // GetPage(
    //   name: AppRoutes.date,
    //   page: () => DateScreen(),
    //   binding: DateBinding(),
    // ),
    GetPage(
      name: AppRoutes.filter,
      page: () => FilterView(),
      binding: FilterBinding(),
    ),

    /*GetPage(
      name: AppRoutes.doctorProfileScreen,
      page: () => DoctorProfileScreen(),
    ),*/
    GetPage(
      name: AppRoutes.doctor,
      page: () => DoctorView(),
      binding: DoctorBinding(),
    ),
    GetPage(name: AppRoutes.homescreen, page: () => const CustomNavigation()),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    // GetPage(
    //   name: AppRoutes.doctor,
    //   page: () => DoctorView(),
    //   binding: DoctorBinding(),
    // ),
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

    GetPage(
      name: AppRoutes.time,
      page: () => const TimeView(),
      binding: TimeBinding(),
    ),
    GetPage(
      name: AppRoutes.attachments,
      page: () => const AttachmentsView(),
      binding: AttachmentsBinding(),
    ),
    GetPage(
      name: AppRoutes.generatingPassword,
      page: () => const GenerateLoginView(),
      binding: GenerateLoginBinding(),
    ),

    //Usman Routes Screens
    GetPage(name: AppRoutes.chatScreen, page: () => ChatScreen()),
  ];
}
