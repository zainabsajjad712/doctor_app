import 'package:get/get.dart';

import 'phone_controller.dart';

class MailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailController>(() => MailController());
  }
}
