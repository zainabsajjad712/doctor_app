import 'package:get/get.dart';

class DateController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void changeDate(DateTime date) {
    selectedDate.value = date;
  }
}