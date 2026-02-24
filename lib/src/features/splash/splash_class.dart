import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    // 2 seconds then go home
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }
}
