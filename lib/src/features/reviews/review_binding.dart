import 'package:doctor_app/src/features/reviews/reviews_controller.dart';
import 'package:get/get.dart';
class ReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewsController());
  }
}