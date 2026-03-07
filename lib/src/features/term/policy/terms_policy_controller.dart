import 'package:get/get.dart';

class TermsPolicyController extends GetxController {

  void goToPrivacy() {
    Get.toNamed('/privacy_policy');
  }

  void goToTerms() {
    Get.toNamed('/terms_use');
  }

}