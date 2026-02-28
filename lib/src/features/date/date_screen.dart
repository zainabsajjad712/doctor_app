// import 'package:doctor_app/src/common/widgets/custom_button.dart';
// import 'package:doctor_app/src/features/date/date_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DateScreen extends StatelessWidget {
//   DateScreen({super.key});

//   final DateController controller = Get.find<DateController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),

//             /// 🔹 Header
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () => Get.back(),
//                     icon: const Icon(Icons.arrow_back),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     "Date of birth",
//                     style: GoogleFonts.openSans(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// 🔹 Calendar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Obx(
//                 () => TableCalendar(
//                   focusedDay: controller.selectedDate.value,
//                   firstDay: DateTime(1950),
//                   lastDay: DateTime.now(),
//                   calendarFormat: CalendarFormat.month,
//                   selectedDayPredicate: (day) =>
//                       isSameDay(day, controller.selectedDate.value),

//                   onDaySelected: (selectedDay, focusedDay) {
//                     controller.changeDate(selectedDay);
//                   },

//                   headerStyle: const HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                     leftChevronIcon: Icon(
//                       Icons.chevron_left,
//                       color: Colors.black,
//                     ),
//                     rightChevronIcon: Icon(
//                       Icons.chevron_right,
//                       color: Colors.black,
//                     ),
//                   ),

//                   daysOfWeekStyle: const DaysOfWeekStyle(
//                     weekdayStyle: TextStyle(fontWeight: FontWeight.w600),
//                     weekendStyle: TextStyle(fontWeight: FontWeight.w600),
//                   ),

//                   calendarStyle: const CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.grey,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Color(0xFF2673FF),
//                       shape: BoxShape.circle,
//                     ),
//                     selectedTextStyle: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),

//             const Spacer(),

//             /// 🔹 Confirm Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: CustomButton(
//                 text: "Confirm",
//                 onTap: () {
//                   Get.back(result: controller.selectedDate.value);
//                 },
//                 borderRadius: 30,
//                 height: 55,
//               ),
//             ),

//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
