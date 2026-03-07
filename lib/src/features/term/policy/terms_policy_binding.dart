import 'package:get/get.dart';
import 'terms_policy_controller.dart';

class TermsPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsPolicyController>(() => TermsPolicyController());
  }
}