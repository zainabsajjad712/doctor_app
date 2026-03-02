import 'dart:async';
import 'package:doctor_app/router/app_routes.dart';
import 'package:get/get.dart';
import 'package:doctor_app/src/features/online_consultation/model/online_consultation_model.dart';

class DoctorVideoCallController extends GetxController {
  late final DoctorModel doctor;

  final RxInt seconds = 0.obs;
  Timer? _t;

  final RxBool micOn = true.obs;
  final RxBool camOn = true.obs;

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments as DoctorModel;

    _t = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds.value++;
    });
  }

  String get timerText {
    final s = seconds.value;
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final r = (s % 60).toString().padLeft(2, '0');
    return "00:$m:$r";
  }

  void toggleMic() => micOn.value = !micOn.value;
  void toggleCam() => camOn.value = !camOn.value;
  void endCall() {
    _t?.cancel(); // stop timer

    Get.offNamed(
      AppRoutes.feedback,
      arguments: doctor, // optional if you want doctor info in feedback
    );
  }

  @override
  void onClose() {
    _t?.cancel();
    super.onClose();
  }
}
