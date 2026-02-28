import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                /// Back Button
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.save, size: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// Doctor Info Card
                _buildDoctorCard(),
                const SizedBox(height: 30),

                /// Reviews Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews And Ratings",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.reviews),
                      child: Text(
                        "View All",
                        style: GoogleFonts.plusJakartaSans(
                          color: Color(0xFF555B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Review Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xffE8E8E8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.grey.withOpacity(0.2),
                        thickness: 1,
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Profile Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://randomuser.me/api/portraits/women/44.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              placeholder: (_, __) => const SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              errorWidget: (_, __, ___) =>
                                  const Icon(Icons.person, size: 50),
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// Name + Time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nabila Reyna",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "30 min ago",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// ⭐ Rating Box
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFF3E6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Color(0xffFFA928),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "4.5",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Color(0xffFFA928),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// Divider
                      const Divider(color: Color(0xffEEEEEE), thickness: 1),

                      const SizedBox(height: 12),

                      /// Description
                      Text(
                        "Excellent service! Dr. Raze Invoker was attentive and thorough. "
                        "The clinic was clean, and the staff were friendly. Highly "
                        "recommend for in-person care!",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                /// 🔵 Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2F80ED),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.appointment),
                    child: Text(
                      "Book an appointment",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDoctorCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=400",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Radiant Hospital",
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xff2673FF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Dr. Raze Invoker",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Internist Specialist",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF555B6C),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 15),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            // color: const Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _infoItem(Icons.verified, "Verify", "Certified"),
              _divider(),
              _infoItem(Icons.work, "5 Years", "Experience"),
              _divider(),
              _infoItem(Icons.star, "4.5", "Rating"),
            ],
          ),
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp 240.000",
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "/hour",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF555B6C),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xffE6F0FF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xff2673FF)),
              ),
              child: Text(
                "Book Now",
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xff2673FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _infoItem(IconData icon, String title, String subtitle) {
  return Column(
    children: [
      Row(
        children: [
          Icon(icon, color: const Color(0xff2673FF), size: 20),

          const SizedBox(width: 5),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
      const SizedBox(height: 6),

      Text(
        subtitle,
        style: GoogleFonts.plusJakartaSans(
          color: Color(0xFF555B6C),
          fontSize: 14,
        ),
      ),
    ],
  );
}

Widget _divider() {
  return Container(height: 40, width: 1, color: Colors.grey.withOpacity(0.5));
}
