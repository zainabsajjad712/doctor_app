import 'package:doctor_app/src/features/date/date_controller.dart';
import 'package:get/get.dart';
class DateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateController>(() => DateController());
  }
}