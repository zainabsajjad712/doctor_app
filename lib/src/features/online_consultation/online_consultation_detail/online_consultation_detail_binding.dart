import 'package:doctor_app/src/features/online_consultation/online_consultation_detail/online_consultation_detail_controller.dart';
import 'package:get/get.dart';

class OnlineConsultationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnlineConsultationDetailController>(
      () => OnlineConsultationDetailController(),
    );
  }
}
