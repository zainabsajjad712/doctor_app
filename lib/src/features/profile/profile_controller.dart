import 'package:get/get.dart';

import 'profile_model.dart';

class ProfileController extends GetxController {
  // simple model object (direct data)
  final DoctorProfileModel doctor = const DoctorProfileModel(
    hospitalName: "Radiant Hospital",
    doctorName: "Dr. Raze Invoker",
    specialty: "Internist Specialist",
    doctorImage:
        "https://images.unsplash.com/photo-1537368910025-700350fe46c7?w=200&fit=crop",
    isOnline: true,
    experience: 5,
    rating: 4.5,
    price: "Rp 240.000",
    priceUnit: "/hour",
    review: ReviewModel(
      userName: "Nabila Reyna",
      timeAgo: "30 min ago",
      rating: 4.5,
      userImage:
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=200&fit=crop",
      comment:
          "Excellent service! Dr. Raze Invoker was attentive and thorough. The clinic was clean, and the staff were friendly. Highly recommend for in-person care!",
    ),
  );
}
