import 'package:get/get.dart';

class ProfileController extends GetxController {
  final doctorName = "Dr. Raze Invoker".obs;
  final hospitalName = "Radiant Hospital".obs;
  final specialization = "Internist Specialist".obs;

  final experience = "5 Years".obs;
  final rating = "4.5".obs;
  final price = "Rp 240.000".obs;

  final reviewerName = "Nabila Reyna".obs;
  final reviewTime = "30 min ago".obs;
  final reviewText =
      "Excellent service! Dr. Raze Invoker was attentive and thorough. "
              "The clinic was clean, and the staff were friendly. "
              "Highly recommend for in-person care!"
          .obs;
}
