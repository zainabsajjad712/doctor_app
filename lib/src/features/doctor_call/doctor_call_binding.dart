import 'package:get/get.dart';
import 'doctor_call_controller.dart';

class DoctorCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorCallController>(() => DoctorCallController());
  }
}
