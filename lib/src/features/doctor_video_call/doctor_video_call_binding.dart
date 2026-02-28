import 'package:get/get.dart';
import 'doctor_video_call_controller.dart';

class DoctorVideoCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorVideoCallController>(() => DoctorVideoCallController());
  }
}
