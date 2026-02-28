import 'package:get/get.dart';
import 'review_model.dart';

class ReviewsController extends GetxController {
  final reviews = <ReviewModel>[
    ReviewModel(
      name: "Nabila Reyna",
      time: "30 min ago",
      image: "https://randomuser.me/api/portraits/women/44.jpg",
      review:
          "Excellent service! Dr. Raze Invoker was attentive and thorough. The clinic was clean, and the staff were friendly. Highly recommend for in-person care!",
      rating: "4.5",
    ),
    ReviewModel(
      name: "Ferry Ichsan A",
      time: "A week ago",
      image: "https://randomuser.me/api/portraits/men/32.jpg",
      review:
          "Quick and easy appointment! Dr. Raze Invoker was professional, and the staff made me feel comfortable. Highly recommend!",
      rating: "5.0",
    ),
  ].obs;
}