// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NavigationController extends GetxController {
//   int _selectedIndex = 0;

//   int get selectedIndex => _selectedIndex;

//   void setSelectedIndex(int value) {
//     _selectedIndex = value;
//     debugPrint("Selected Index Updated: $_selectedIndex");
//     update();
//   }
// }
import 'package:get/get.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    update(); // UI refresh karega
  }
}