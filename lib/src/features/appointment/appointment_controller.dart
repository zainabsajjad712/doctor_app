import 'package:doctor_app/src/features/appointment/appointment_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppointmentController extends GetxController {
  late AppointmentModel appointment;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments is AppointmentModel) {
      appointment = Get.arguments as AppointmentModel;
    } else {
      /// Fallback dummy data (Web refresh fix)
      appointment = AppointmentModel(
        date: "09 Jan 2025",
        time: "13:00 PM",
        location: "Radiant Hospital",
        doctorName: "Dr. Raze Invoker",
        doctorSpecialist: "Internist Specialist",
        doctorImage:
            "https://images.unsplash.com/photo-1537368910025-700350fe46c7",
      );
    }
  }
}
