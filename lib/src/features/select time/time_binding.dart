import 'package:get/get.dart';
import 'time_controller.dart';

class TimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeController());
  }
}