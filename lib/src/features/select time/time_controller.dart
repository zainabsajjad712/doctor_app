import 'package:get/get.dart';

class TimeController extends GetxController {
  var selectedTime = "".obs;

  final List<String> morningTimes = [
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
  ];

  final List<String> afternoonTimes = [
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
  ];

  void selectTime(String time) {
    selectedTime.value = time;
  }

  void confirmTime() {
    if (selectedTime.value.isNotEmpty) {
      Get.back(result: selectedTime.value);
    }
  }
}