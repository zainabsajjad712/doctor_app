import 'package:doctor_app/src/features/auth/phone_verification/phone_controller.dart';
import 'package:get/get.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneController>(() => PhoneController());
  }
}
