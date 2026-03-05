import 'package:get/get.dart';
import 'interest_list_controller.dart';

class InterestListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestListController());
  }
}