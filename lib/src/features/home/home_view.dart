// import 'package:doctor_app/router/app_routes.dart';
// import 'package:doctor_app/src/common/widgets/custom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: AppColor.scaffoldBg,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               /// HEADER
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Welcome home, Rakim\nMayers",
//                     style: GoogleFonts.plusJakartaSans(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const CircleAvatar(
//                     radius: 22,
//                     backgroundImage:
//                         NetworkImage("https://i.pravatar.cc/300"),
//                   )
//                 ],
//               ),

//               const SizedBox(height: 25),

//               /// BLUE CARD
//               Container(
//                 height: 170,
//                 width: size.width,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(24),
//                   gradient: const LinearGradient(
//                     colors: [Color(0xff3A7BFF), Color(0xff2673FF)],
//                   ),
//                 ),
//                 child: Stack(
//                   children: [

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Trusted doctor on your schedule 😊",
//                           style: GoogleFonts.plusJakartaSans(
//                               color: AppColor.white70, fontSize: 12),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           "Consult A Doctor\n— Book Today!",
//                           style: GoogleFonts.plusJakartaSans(
//                             color: AppColor.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const Spacer(),
//                         Row(
//                           children: [
//                             _buildStackAvatar(),
//                             const SizedBox(width: 10),
//                             Text(
//                               "30.000+\nHappy Patients",
//                               style: GoogleFonts.plusJakartaSans(
//                                   color: AppColor.white, fontSize: 11),
//                             )
//                           ],
//                         )
//                       ],
//                     ),

//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: Image.network(
//                         "https://i.ibb.co/2kR6z9H/doctor.png",
//                         height: 150,
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               /// SECTION TITLE
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Interested Doctors",
//                       style: GoogleFonts.plusJakartaSans(
//                           fontWeight: FontWeight.w700, fontSize: 16)),
//                   Text("See All",
//                       style: GoogleFonts.plusJakartaSans(
//                           color: AppColor.primaryBlue ))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),

//       /// CUSTOM BOTTOM NAV
//       bottomNavigationBar:CustomNavigation(),
//       floatingActionButton: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.blue.withOpacity(0.4),
//                 blurRadius: 20)
//           ],
//         ),
//         child: FloatingActionButton(
//           backgroundColor: AppColor.primaryBlue ,
//           onPressed: () {},
//           child: const Icon(Icons.add),
//         ),
//       ),
//       floatingActionButtonLocation:
//           FloatingActionButtonLocation.centerDocked,
//     );
//   }

//   Widget _buildStackAvatar() {
//     return SizedBox(
//       width: 70,
//       child: Stack(
//         children: const [
//           CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/301")),
//           Positioned(
//               left: 18,
//               child: CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/302"))),
//           Positioned(
//               left: 36,
//               child: CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/303"))),
//         ],
//       ),
//     );
//   }
// }

// class _CustomBottomNav extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 75,
//       decoration: const BoxDecoration(
//         color: AppColor.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 20,
//             color: Colors.black12,
//           )
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _navItem(Icons.home, 0),
//           _navItem(Icons.search, 1),
//           const SizedBox(width: 40),
//           _navItem(Icons.calendar_today, 2),
//           _navItem(Icons.settings, 3),
//         ],
//       ),
//     );
//   }

//   Widget _navItem(IconData icon, int index) {
//     return Obx(() => GestureDetector(
//           onTap: () {
//             controller.changeIndex(index);
//             if (index == 1) {
//               Get.toNamed(AppRoutes.search);
//             }
//           },
//           child: Icon(
//             icon,
//             color: controller.selectedIndex.value == index
//                 ? AppColor.primaryBlue
//                 : Colors.grey,
//           ),
//         ));
//   }
// }import 'package:doctor_app/router/app_routes.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: AppColor.scaffoldBg,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Welcome home, Rakim\nMayers",
//                     style: GoogleFonts.plusJakartaSans(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const CircleAvatar(
//                     radius: 22,
//                     backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 25),

//               /// BLUE CARD
//               Container(
//                 height: 170,
//                 width: size.width,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(24),
//                   gradient: const LinearGradient(
//                     colors: [Color(0xff3A7BFF), Color(0xff2673FF)],
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Trusted doctor on your schedule 😊",
//                           style: GoogleFonts.plusJakartaSans(
//                             color: AppColor.white70,
//                             fontSize: 12,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           "Consult A Doctor\n— Book Today!",
//                           style: GoogleFonts.plusJakartaSans(
//                             color: AppColor.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const Spacer(),
//                         Row(
//                           children: [
//                             _buildStackAvatar(),
//                             const SizedBox(width: 10),
//                             Text(
//                               "30.000+\nHappy Patients",
//                               style: GoogleFonts.plusJakartaSans(
//                                 color: AppColor.white,
//                                 fontSize: 11,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             "https://images.unsplash.com/photo-1537368910025-700350fe46c7",
//                         height: 80,
//                         width: 80,
//                         fit: BoxFit.cover,
//                         placeholder: (context, url) =>
//                             const Center(child: CircularProgressIndicator()),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               /// SECTION TITLE
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Interested Doctors",
//                     style: GoogleFonts.plusJakartaSans(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(
//                     "See All",
//                     style: GoogleFonts.plusJakartaSans(
//                       color: AppColor.primaryBlue ,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStackAvatar() {
//     return SizedBox(
//       width: 100, // 👈 increase kar diya
//       height: 36,
//       child: Stack(
//         clipBehavior: Clip.none, // 👈 safety
//         children: [
//           Positioned(
//             left: 0,
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
//               ),
//             ),
//           ),
//           Positioned(
//             left: 25,
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1552058544-f2b08422138a",
//               ),
//             ),
//           ),
//           Positioned(
//             left: 50,
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome home, Rakim\nMayers",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1599566150163-29194dcaad36?w=200",
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                /// BLUE CARD
                Container(
                  height: 170,
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Color(0xff3A7BFF), Color(0xff2673FF)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trusted doctor on your schedule 😊",
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColor.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Consult A Doctor\n— Book Today!",
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColor.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              _buildStackAvatar(),
                              const SizedBox(width: 10),
                              Text(
                                "30.000+\nHappy Patients",
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColor.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://images.unsplash.com/photo-1537368910025-700350fe46c7",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// SECTION TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Interested Doctors",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "See All",
                      style: GoogleFonts.openSans(
                        color: AppColor.primaryBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// DOCTOR CARD
                _buildDoctorCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStackAvatar() {
    return SizedBox(
      width: 100,
      height: 36,
      child: Stack(
        children: const [
          Positioned(
            left: 0,
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
              ),
            ),
          ),
          Positioned(
            left: 25,
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1552058544-f2b08422138a",
              ),
            ),
          ),
          Positioned(
            left: 50,
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
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
                      color: AppColor.primaryBlue,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffE6F0FF),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColor.primaryBlue),
                ),
                child: Text(
                  "Book Now",
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColor.primaryBlue,
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
            Icon(icon, color: AppColor.primaryBlue, size: 20),

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
}

//   Widget _buildStackAvatar() {
//     return SizedBox(
//       width: 70,
//       child: Stack(
//         children: [
//           Positioned(
//             left: 0,
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
//               ),
//             ),
//           ),
//           Positioned(
//             left: 25,
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1552058544-f2b08422138a",
//               ),
//             ),
//           ),
//           Positioned(
//             left: 50,
//             child: CircleAvatar(
//               radius: 18,
//               backgroundImage: NetworkImage(
//                 "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
