// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../common/constant/app_colors.dart';
// import 'interest_list_controller.dart';

// class InterestListView extends GetView<InterestListController> {
//   const InterestListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Back
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Get.back(),
//                     child: Icon(Icons.arrow_back),
//                   ),

//                   SizedBox(width: 20.w),

//                   Text(
//                     "Interest list",
//                     style: GoogleFonts.poppins(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 25.h),

//               /// Tabs
//               Obx(
//                 () => Row(
//                   children: [
//                     tabButton("Doctor", 0),
//                     SizedBox(width: 15.w),
//                     tabButton("Hospital", 1),
//                     SizedBox(width: 15.w),
//                     tabButton("News", 2),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 250.h),

//               Obx(() {
//                 if (controller.selectedTab.value == 0) {
//                   return Column(
//                     children: [
//                       Text(
//                         "You haven't followed any doctors yet",
//                         style: GoogleFonts.poppins(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       Text(
//                         "Choose the best doctor for you.",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       SizedBox(height: 270.h),

//                       Container(
//                         width: double.infinity,
//                         height: 60.h,
//                         decoration: BoxDecoration(
//                           color: AppColor.primaryButton,
//                           borderRadius: BorderRadius.circular(30.r),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Find doctors",
//                           style: GoogleFonts.poppins(
//                             color: AppColor.white,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }

//                 return Column(
//                   children: List.generate(
//                     5,
//                     (index) => Container(
//                       margin: EdgeInsets.only(bottom: 15.h),
//                       padding: EdgeInsets.all(10.w),
//                       decoration: BoxDecoration(
//                         color: AppColor.white,
//                         borderRadius: BorderRadius.circular(15.r),
//                       ),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.r),
//                             child: Image.network(
//                               "https://images.unsplash.com/photo-1586773860418-d37222d8fce3",
//                               height: 60.h,
//                               width: 60.w,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                           SizedBox(width: 10.w),

//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Mayo Clinic",
//                                 style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),

//                               Text(
//                                 "200 First St, MN",
//                                 style: GoogleFonts.poppins(fontSize: 12.sp),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget tabButton(String text, int index) {
//     return GestureDetector(
//       onTap: () => controller.changeTab(index),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 8.h),
//         decoration: BoxDecoration(
//           color: controller.selectedTab.value == index
//               ? AppColor.primaryBlue
//               : Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         child: Text(
//           text,
//           style: GoogleFonts.poppins(
//             color: controller.selectedTab.value == index
//                 ? Colors.white
//                 : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'interest_list_controller.dart';

class InterestListView extends GetView<InterestListController> {
  const InterestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              /// HEADER
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "Interest list",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              /// TABS
              Obx(
                () => Row(
                  children: [
                    tabButton("Doctor", 0),
                    SizedBox(width: 10.w),
                    tabButton("Hospital", 1),
                    SizedBox(width: 10.w),
                    tabButton("News", 2),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              /// BODY
              Expanded(
                child: Obx(() {
                  /// DOCTOR EMPTY STATE
                  if (controller.selectedTab.value == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You haven't followed any doctors yet",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 10.h),

                        Text(
                          "Choose the best doctor for you.",
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 40.h),

                        Container(
                          width: double.infinity,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: AppColor.primaryBlue,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Find doctors",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  /// HOSPITAL LIST
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          children: [
                            /// IMAGE
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1586773860418-d37222d8fce3",
                                height: 70.h,
                                width: 70.w,
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(width: 12.w),

                            /// TEXT
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mayo Clinic",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),

                                  SizedBox(height: 4.h),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        "200 First St, MN",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 5.h),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        size: 14,
                                        color: Colors.amber,
                                      ),

                                      SizedBox(width: 5.w),

                                      Text(
                                        "4.5",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// BOOKMARK
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: AppColor.primaryBlue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.bookmark,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// TAB BUTTON
  Widget tabButton(String text, int index) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == index
              ? AppColor.primaryBlue
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            color: controller.selectedTab.value == index
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
