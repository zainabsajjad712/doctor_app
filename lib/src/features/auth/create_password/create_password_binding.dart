import 'package:doctor_app/src/features/auth/create_password/create_password_controller.dart';
import 'package:get/get.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePasswordController>(() => CreatePasswordController());
  }
}
