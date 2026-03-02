import 'package:get/get.dart';
import '../model/online_consultation_model.dart';

class OnlineConsultationDetailController extends GetxController {
  late final DoctorModel doctor;

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments as DoctorModel; // ✅ receive
  }
}
