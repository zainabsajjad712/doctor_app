// import 'package:doctor_app/router/app_routes.dart';
// import 'package:get/get.dart';

// class SearchController extends GetxController {
//   RxList<String> mostSearched = <String>[
//     "Covid-19",
//     "Vaccine",
//     "Catastrophe",
//     "Diabetes",
//     "Respiratory disease",
//   ].obs;

//   RxString selectedItem = "".obs;

//   void selectItem(String item) {
//     if (selectedItem.value == item) {
//       selectedItem.value = "";
//     } else {
//       selectedItem.value = item;
//     }
//   }
// }

// void selectItem(String item) {
//   Get.toNamed(AppRoutes.news, arguments: {"query": item});
// }
import 'package:doctor_app/router/app_routes.dart';
import 'package:get/get.dart';

class SearchesController extends GetxController {
  RxList<String> mostSearched = <String>[
    "Covid-19",
    "Vaccine",
    "Catastrophe",
    "Diabetes",
    "Respiratory disease",
  ].obs;

  RxString selectedItem = "".obs;

  void selectItem(String item) {
    selectedItem.value = item;

    Get.toNamed(AppRoutes.news, arguments: {"query": item});
  }
}
