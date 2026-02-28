import 'dart:async';
import 'package:get/get.dart';
import 'package:doctor_app/src/features/online_consultation/model/online_consultation_model.dart';

class DoctorCallController extends GetxController {
  late final DoctorModel doctor;

  final RxString statusText = "Connecting...".obs;
  Timer? _timer;

  final RxBool micOn = true.obs;
  final RxBool videoOn = true.obs;

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments as DoctorModel;

    // ✅ after some seconds show unable to connect
    _timer = Timer(const Duration(seconds: 5), () {
      statusText.value = "Unable to connect, please try again";
    });
  }

  void toggleMic() => micOn.value = !micOn.value;
  void toggleVideo() => videoOn.value = !videoOn.value;

  void endCall() {
    Get.back(); // close call screen
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
