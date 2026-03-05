import 'package:get/get.dart';
import 'doctor_controller.dart';

class FindDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindDoctorController>(() => FindDoctorController());
  }
}
