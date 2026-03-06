import 'package:get/get.dart';

class DoctorProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorProfileBinding());
  }
}