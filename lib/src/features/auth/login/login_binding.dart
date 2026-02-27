import 'package:doctor_app/src/features/auth/login/controller.dart';
import 'package:get/get.dart';
class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalInfoController>(
      () => PersonalInfoController(),
    );
  }
}