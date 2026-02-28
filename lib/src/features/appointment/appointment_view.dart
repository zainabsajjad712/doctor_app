import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:doctor_app/src/features/appointment/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppointmentView extends GetView<AppointmentController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.appointment;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Top Bar
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Book An Appointment",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Details Appointment",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),

              /// 🔹 First Container (3 Rows)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xffE5E7EB)),
                ),
                child: Column(
                  children: [
                    _infoTile(
                      data.date,
                      "Appointment Date",
                      Icons.calendar_today_outlined,
                    ),

                    const Divider(height: 30),

                    // _infoTile(
                    //   data.time,
                    //   "Appointment Time",
                    //   Icons.access_time_outlined,
                    // ),
                    _infoTile(
                      data.time,
                      "Appointment Time",
                      Icons.access_time_outlined,
                      onTap: () async {
                        final result = await Get.toNamed('/time');

                        if (result != null) {
                          controller.appointment = controller.appointment
                              .copyWith(time: result);
                          controller.update();
                        }
                      },
                    ),

                    const Divider(height: 30),

                    // _infoTile(
                    //   data.location,
                    //   "Appointment Location",
                    //   Icons.local_hospital_outlined,
                    // ),
                    _infoTile(
                      data.location,
                      "Appointment Location",
                      Icons.local_hospital_outlined,
                      onTap: () async {
                        final result = await Get.toNamed('/attachments');

                        if (result != null) {
                          controller.appointment = controller.appointment
                              .copyWith(location: result);

                          controller.update();
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 Doctor Container (Different Color)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF4FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        imageUrl: data.doctorImage,
                        height: 55,
                        width: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.doctorName,
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: const Color(0xFF292D32),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data.doctorSpecialist,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: const Color(0xff555B6C),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.verified,
                      color: Color(0xff1D7885),
                      size: 30,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// 🔹 Button
              CustomButton(
                onTap: () {
                  // 🔹 Your button action
                },
                text: "Book an appointment",
                borderRadius: 30,
                textSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xff2F80ED),
                textColor: Colors.white,
                width: double.infinity,
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  //   Widget _infoTile(String title, String subtitle, IconData icon) {
  //     return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               title,
  //               style: GoogleFonts.plusJakartaSans(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w700,
  //                 color: Color(0xFF292D32),
  //               ),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               subtitle,
  //               style: GoogleFonts.plusJakartaSans(
  //                 fontSize: 16,
  //                 color: const Color(0xFF555B6C),
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ],
  //         ),
  //         // Container(
  //         //   padding: const EdgeInsets.all(10),
  //         //   decoration: const BoxDecoration(
  //         //     color: Color(0xffF3F4F6),
  //         //     shape: BoxShape.circle,
  //         //   ),
  //         //   child:
  //         Icon(icon, size: 24, color: const Color(0xFF555B6C)),
  //       ],
  //     );
  //   }
  // }
  Widget _infoTile(
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF292D32),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  color: const Color(0xFF555B6C),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Icon(icon, size: 24, color: const Color(0xFF555B6C)),
        ],
      ),
    );
  }
}
