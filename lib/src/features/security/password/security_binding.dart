import 'package:doctor_app/src/features/security/password/security_controller.dart';
import 'package:get/get.dart';

class PasswordSecurityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordSecurityController>(
      () => PasswordSecurityController(),
    );
  }
}