import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_controller.dart';

class SearchView extends GetView<SearchesController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchesController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Search Field
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(
                        searchTerms: controller.mostSearched,
                      ),
                    );
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/search.svg",
                          height: 20.h,
                        ),
                        SizedBox(width: 13.w),
                        Text(
                          "Search doctor, hospital, news...",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50.h),

                /// Illustration Image
                Image.asset(
                  "assets/images/doctor.png", // apna asset path dalna
                  height: 220.h,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 30.h),

                /// Most Searched Title
                Text(
                  "Most Searched",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20.h),

                /// Search Chips
                Obx(
                  () => Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    alignment: WrapAlignment.center,
                    children: controller.mostSearched.map((item) {
                      final bool isSelected =
                          controller.selectedItem.value == item;

                      return GestureDetector(
                        onTap: () {
                          controller.selectItem(item);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart' hide SearchController;
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'search_controller.dart';

// class SearchView extends GetView<SearchController> {
//   const SearchView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//             child: Column(
//               children: [
//                 /// Title
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Search",
//                     style: TextStyle(
//                       fontSize: 22.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 20.h),

//                 /// Search Field
//                 Container(
//                   height: 50.h,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search doctor, hospital, news,...",
//                       prefixIcon: Icon(Icons.search, size: 22.sp),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(vertical: 15.h),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 40.h),

//                 /// Alternative Illustration (No Asset Needed)
//                 Container(
//                   height: 220.h,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.blue.shade50,
//                     borderRadius: BorderRadius.circular(25.r),
//                   ),
//                   child: Center(
//                     child: Icon(
//                       Icons.health_and_safety,
//                       size: 120.sp,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 30.h),

//                 /// Most Searched Title
//                 Text(
//                   "Most Searched",
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 SizedBox(height: 20.h),

//                 /// Chips
//                 Obx(
//                   () => Wrap(
//                     spacing: 10.w,
//                     runSpacing: 10.h,
//                     alignment: WrapAlignment.center,
//                     children: controller.mostSearched.map((item) {
//                       final isSelected = controller.selectedItem.value == item;

//                       return GestureDetector(
//                         onTap: () => controller.selectItem(item),
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 200),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 18.w,
//                             vertical: 10.h,
//                           ),
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.white,
//                             borderRadius: BorderRadius.circular(25.r),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 4,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Text(
//                             item,
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500,
//                               color: isSelected ? Colors.white : Colors.black87,
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),

//                 SizedBox(height: 40.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
