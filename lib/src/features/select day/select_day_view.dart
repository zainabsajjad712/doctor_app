// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../common/widgets/custom_button.dart';
// import 'select_day_controller.dart';

// class SelectDayView extends GetView<SelectDayController> {
//   const SelectDayView({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(title: const Text("Select Day")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [

//             Expanded(
//               child: GridView.builder(
//                 itemCount: 31,
//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 7,
//                 ),
//                 itemBuilder: (_, index) {
//                   int day = index + 1;

//                   return Obx(() {
//                     bool isSelected =
//                         controller.selectedDay.value == day;

//                     return GestureDetector(
//                       onTap: () => controller.selectDay(day),
//                       child: Container(
//                         margin: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? const Color(0xff2F80ED)
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           "$day",
//                           style: TextStyle(
//                             color:
//                                 isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     );
//                   });
//                 },
//               ),
//             ),

//             CustomButton(
//               onTap: controller.confirm,
//               text: "Confirm",
//               borderRadius: 30,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }