import 'package:get/get.dart';

class FindDoctorController extends GetxController {
  /// 🔹 Original Doctors List
  final RxList<Map<String, String>> doctors = <Map<String, String>>[
    {
      "image": "https://i.pravatar.cc/300?img=1",
      "hospital": "Radiant Hospital",
      "name": "Dr. Raze Invoker",
      "specialist": "Internist Specialist",
    },
    {
      "image": "https://i.pravatar.cc/300?img=2",
      "hospital": "Radiant Hospital",
      "name": "Dr. Raze Invoker",
      "specialist": "Internist Specialist",
    },
    {
      "image": "https://i.pravatar.cc/300?img=3",
      "hospital": "Radiant Hospital",
      "name": "Dr. Raze Invoker",
      "specialist": "Internist Specialist",
    },
    {
      "image": "https://i.pravatar.cc/300?img=4",
      "hospital": "Radiant Hospital",
      "name": "Dr. Raze Invoker",
      "specialist": "Internist Specialist",
    },
    {
      "image": "https://i.pravatar.cc/300?img=4",
      "hospital": "Radiant Hospital",
      "name": "Dr. Raze Invoker",
      "specialist": "Internist Specialist",
    },
  ].obs;

  /// 🔹 Filtered List
  final RxList<Map<String, String>> filteredDoctors =
      <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredDoctors.assignAll(doctors);
  }

  /// 🔹 Search Function
  void updateSearch(String value) {
    if (value.trim().isEmpty) {
      filteredDoctors.assignAll(doctors);
      return;
    }

    final query = value.toLowerCase();

    final results = doctors.where((doctor) {
      final name = doctor["name"]!.toLowerCase();
      final hospital = doctor["hospital"]!.toLowerCase();
      final specialist = doctor["specialist"]!.toLowerCase();

      return name.contains(query) ||
          hospital.contains(query) ||
          specialist.contains(query);
    }).toList();

    filteredDoctors.assignAll(results);
  }
}
