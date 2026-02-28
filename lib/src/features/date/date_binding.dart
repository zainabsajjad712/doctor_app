import 'package:get/get.dart';
import 'date_controller.dart';

class DateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateController>(() => DateController());
  }
}