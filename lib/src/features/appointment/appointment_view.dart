import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentView extends GetView {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: Text("Details Appointment",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 18, fontWeight: FontWeight.w600)),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("09 Jan 2025",
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text("13:00 PM"),
                  const SizedBox(height: 8),
                  Text("Radiant Hospital"),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2F80ED),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {},
                child: Text("Book an appointment",
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600)),
              ),
            )
          ],
        ),
      ),
    );
  }
}