import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_controller.dart';

class TimeView extends GetView<TimeController> {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.border,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Select time",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _section("Morning", controller.morningTimes),
              const SizedBox(height: 30),
              _section("Afternoon", controller.afternoonTimes),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: controller.confirmTime,
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section(String title, List<String> times) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 30,
          runSpacing: 25,
          children: times.map((time) {
            return Obx(() {
              final isSelected = controller.selectedTime.value == time;
              return GestureDetector(
                onTap: () => controller.selectTime(time),
                child: Container(
                  width: 100,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primaryButton : AppColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    time,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500)
                        .copyWith(
                          color: isSelected ? AppColor.white : AppColor.black,
                        ),
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ],
    );
  }
}
