import 'package:get/get.dart';
import 'online_consultation_controller.dart';

class OnlineConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnlineConsultationController>(
      () => OnlineConsultationController(),
    );
  }
}
