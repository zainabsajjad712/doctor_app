import 'package:get/get.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}
