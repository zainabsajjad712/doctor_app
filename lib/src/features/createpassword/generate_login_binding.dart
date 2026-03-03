import 'package:get/get.dart';
import 'generate_login_controller.dart';

class GenerateLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateLoginController>(
      () => GenerateLoginController(),
    );
  }
}