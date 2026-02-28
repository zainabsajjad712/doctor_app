import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString gender = ''.obs;

  void selectGender(String value) {
    gender.value = value;
  }

  @override
  void onClose() {
    nameController.dispose();
    dobController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PersonalInfoController extends GetxController {

//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final dobController = TextEditingController();

//   RxString gender = "Male".obs;

//   void selectGender(String value) {
//     gender.value = value;
//   }
// }
