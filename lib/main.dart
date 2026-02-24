import 'package:doctor_app/router/app_pages.dart';
import 'package:doctor_app/router/app_routes.dart';
import 'package:doctor_app/src/common/constant/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
//     GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      // ✅ Your already-added key (global snackbars, etc.)
      scaffoldMessengerKey: scaffoldMessengerKey,

      // ✅ GetX Router setup
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.pages,

      // optional fallback:
      // unknownRoute: GetPage(
      //   name: '/notfound',
      //   page: () => const Scaffold(body: Center(child: Text('Not Found'))),
      // ),
    );
  }
}
