import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedItems = <String>[].obs;

  void toggleSelection(String value) {
    if (selectedItems.contains(value)) {
      selectedItems.remove(value);
    } else {
      selectedItems.add(value);
    }
  }

  bool isSelected(String value) {
    return selectedItems.contains(value);
  }
}