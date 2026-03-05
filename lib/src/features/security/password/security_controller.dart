import 'package:get/get.dart';

class PasswordSecurityController extends GetxController {

  RxBool faceIdEnabled = false.obs;

  void toggleFaceId(bool value) {
    faceIdEnabled.value = value;
  }

}