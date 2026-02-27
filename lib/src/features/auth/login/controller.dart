import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();

  RxString gender = "Male".obs;

  void selectGender(String value) {
    gender.value = value;
  }
}