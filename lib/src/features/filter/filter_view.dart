import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filter_controller.dart';

class FilterView extends StatelessWidget {
  FilterView({super.key});

  final FilterController controller = Get.find();

  final List<Map<String, dynamic>> items = [
    {"title": "Toothcare", "icon": Icons.medical_services},
    {"title": "Cardiology", "icon": Icons.favorite},
    {"title": "Eye", "icon": Icons.remove_red_eye},
    {"title": "Pediatrics", "icon": Icons.child_care},
    {"title": "Neurology", "icon": Icons.psychology},
    {"title": "Infectious", "icon": Icons.share},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              /// Header
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(width: 10),
                  Text(
                    "Filter",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// List
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Obx(
                      () => Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            /// Blue Icon Box
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xff2E7DFF),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                item["icon"],
                                color: Colors.white,
                                size: 26,
                              ),
                            ),

                            const SizedBox(width: 15),

                            /// Title
                            Expanded(
                              child: Text(
                                item["title"],
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            /// Checkbox
                            Checkbox(
                              value: controller
                                  .isSelected(item["title"]),
                              onChanged: (_) {
                                controller
                                    .toggleSelection(item["title"]);
                              },
                              activeColor:
                                  const Color(0xff2E7DFF),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// Apply Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                     // ✅ Replace this
      Get.toNamed(AppRoutes.personalInfo);  // <-- COPY-PASTE YAHAN
    },
                  //   Get.snackbar(
                  //     "Selected",
                  //     controller.selectedItems.join(", "),
                  //     backgroundColor: Colors.blue,
                  //     colorText: Colors.white,
                  //   );
                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xff2E7DFF),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Apply filter",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}