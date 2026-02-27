import 'package:doctor_app/src/features/date/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<DateController>();

    return Scaffold(
      backgroundColor: AppColor.inputFill,

      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Date of birth",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Obx(() => CalendarDatePicker(
                initialDate: controller.selectedDate.value,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                onDateChanged: controller.changeDate,
              )),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Get.back(),
                child: const Text("Confirm"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}