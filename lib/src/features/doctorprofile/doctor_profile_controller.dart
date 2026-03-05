import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileController extends GetxController {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  RxString gender = "Male".obs;

  final formKey = GlobalKey<FormState>();

  void saveProfile(){

    if(formKey.currentState!.validate()){
      Get.snackbar("Success", "Profile Saved");
    }

  }

}