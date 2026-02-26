import 'package:doctor_app/router/app_pages.dart';
import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 849),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,
          initialRoute: AppRoutes.onlineConsultation,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
