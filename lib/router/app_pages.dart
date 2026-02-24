import 'package:doctor_app/src/features/splash/splash_class.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
  ];
}
