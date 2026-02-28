// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'doctor_controller.dart';

// class DoctorView extends StatelessWidget {
//   DoctorView({super.key});

//   final DoctorController controller = Get.put(
//     DoctorController(),
//     permanent: true,
//   );

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: AppColor.scaffoldBg,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(size.width * 0.05),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Header
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.arrow_back),
//                   ),
//                   Text(
//                     "Find Doctors",
//                     style: GoogleFonts.openSans(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFD9D9D9),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(Icons.tune, size: 20),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 20),

//               /// Search Field
//               TextField(
//                 onChanged: controller.updateSearch,
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: GoogleFonts.openSans(color: Colors.black),
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: Color(0xFFD9D9D9),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(14),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               Text(
//                 "Interested Doctors",
//                 style: GoogleFonts.openSans(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),

//               const SizedBox(height: 35),

//               Expanded(
//                 child: Obx(
//                   () => ListView.builder(
//                     itemCount: controller.filteredDoctors.length,
//                     itemBuilder: (context, index) {
//                       final doctor = controller.filteredDoctors[index];

//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 15),
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: AppColor.white,
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(14),
//                               child: CachedNetworkImage(
//                                 imageUrl: doctor["image"] ?? "",
//                                 height: 75,
//                                 width: 75,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),

//                             const SizedBox(width: 15),

//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   doctor["hospital"] ?? "",
//                                   style: GoogleFonts.plusJakartaSans(
//                                     color: Color(0xFF2673FF),
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   doctor["name"] ?? "",
//                                   style: GoogleFonts.plusJakartaSans(
//                                     color: AppColor.textPrimary,,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 Text(
//                                   doctor["specialist"] ?? "",
//                                   style: GoogleFonts.plusJakartaSans(
//                                     color: Color(0xFF555B6C),
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'doctor_controller.dart';

class DoctorView extends StatelessWidget {
  DoctorView({super.key});

  final DoctorController controller = Get.put(
    DoctorController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Find Doctors",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.inputFill,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, size: 20),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Search Field
              TextField(
                onChanged: controller.updateSearch,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.openSans(color: Colors.black),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColor.inputFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Interested Doctors Title
              Text(
                "Interested Doctors",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              /// LIST SECTION
              Expanded(
                child: Obx(() {
                  if (controller.filteredDoctors.isEmpty) {
                    return const Center(child: Text("No Doctors Found"));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🔹 First Doctor Only
                        _doctorCard(controller.filteredDoctors.first),

                        const SizedBox(height: 25),

                        /// 🔹 All Doctors Title
                        Text(
                          "All Doctors",
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 Remaining Doctors
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.filteredDoctors.length - 1,
                          itemBuilder: (context, index) {
                            final doctor =
                                controller.filteredDoctors[index + 1];
                            return _doctorCard(doctor);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Doctor Card Widget
  Widget _doctorCard(Map<String, String> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              imageUrl: doctor["image"] ?? "",
              height: 75,
              width: 75,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                height: 75,
                width: 75,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor["hospital"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                doctor["name"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColor.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Text(
                doctor["specialist"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColor.textSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
