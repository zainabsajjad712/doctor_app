import 'package:get/get.dart';
import 'model/online_consultation_model.dart';

class OnlineConsultationController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString query = ''.obs;

  final RxList<DoctorModel> allDoctors = <DoctorModel>[].obs;
  final RxList<DoctorModel> filteredDoctors = <DoctorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyDoctors(); // ✅ dummy data auto load
  }

  void loadDummyDoctors() {
    isLoading.value = true;

    // ✅ Dummy network images (working URLs)
    final dummy = <DoctorModel>[
      DoctorModel(
        id: "1",
        hospital: "Radiant Hospital",
        name: "Dr. Raze Invoker",
        specialty: "Internist Specialist",
        imageUrl: "https://i.pravatar.cc/150?img=12",
        isOnline: true,
      ),
      DoctorModel(
        id: "2",
        hospital: "Radiant Hospital",
        name: "Dr. Raze Invoker",
        specialty: "Internist Specialist",
        imageUrl: "https://i.pravatar.cc/150?img=32",
        isOnline: true,
      ),
      DoctorModel(
        id: "3",
        hospital: "Radiant Hospital",
        name: "Dr. Raze Invoker",
        specialty: "Internist Specialist",
        imageUrl: "https://i.pravatar.cc/150?img=48",
        isOnline: false,
      ),
    ];

    allDoctors.assignAll(dummy);
    filteredDoctors.assignAll(dummy);

    isLoading.value = false;
  }

  void onSearchChanged(String value) {
    query.value = value.trim();

    if (query.value.isEmpty) {
      filteredDoctors.assignAll(allDoctors);
      return;
    }

    final q = query.value.toLowerCase();
    final results = allDoctors.where((d) {
      return d.name.toLowerCase().contains(q) ||
          d.hospital.toLowerCase().contains(q) ||
          d.specialty.toLowerCase().contains(q);
    }).toList();

    filteredDoctors.assignAll(results);
  }
}
