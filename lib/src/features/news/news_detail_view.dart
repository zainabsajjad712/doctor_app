// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'news_model.dart';

// class NewsDetailView extends StatelessWidget {
//   const NewsDetailView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final NewsModel news = Get.arguments;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20.r),
//                 child: Image.network(news.image),
//               ),

//               SizedBox(height: 20.h),

//               Text(news.category,
//                   style: GoogleFonts.poppins(
//                       color: Colors.red,
//                       fontWeight: FontWeight.w600)),

//               SizedBox(height: 10.h),

//               Text(news.title,
//                   style: GoogleFonts.poppins(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold)),

//               SizedBox(height: 10.h),

//               Text(news.time,
//                   style: GoogleFonts.poppins(color: Colors.grey)),

//               SizedBox(height: 20.h),

//               Text(news.description,
//                   style: GoogleFonts.poppins(fontSize: 14.sp)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:share_plus/share_plus.dart';
// import 'news_model.dart';
// import 'package:doctor_app/router/app_routes.dart';

// class NewsDetailView extends StatelessWidget {
//   const NewsDetailView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final NewsModel news = Get.arguments;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(25.r),
//                       bottomRight: Radius.circular(25.r),
//                       topLeft: Radius.circular(25.r),
//                       topRight: Radius.circular(25.r),
//                     ),
//                     child: Image.network(
//                       news.image,
//                       width: double.infinity,
//                       height: 250.h,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   /// 🔙 Back Button
//                   Positioned(
//                     top: 15.h,
//                     left: 15.w,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black.withOpacity(0.5),
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () {
//                           Get.back();
//                         },
//                       ),
//                     ),
//                   ),

//                   /// 🔗 Share Button
//                   Positioned(
//                     top: 15.h,
//                     right: 70.w,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black.withOpacity(0.5),
//                       child: IconButton(
//                         icon: const Icon(Icons.share, color: Colors.white),
//                         onPressed: () {
//                           Share.share("${news.title}\n\n${news.description}");
//                         },
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     top: 15.h,
//                     right: 15.w,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black.withOpacity(0.5),
//                       child: IconButton(
//                         icon: const Icon(Icons.bookmark, color: Colors.white),
//                         onPressed: () {
//                           Get.toNamed(
//                             AppRoutes.homescreen, // next screen route
//                             arguments: news,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               /// 📄 CONTENT
//               Padding(
//                 padding: EdgeInsets.all(20.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       news.category,
//                       style: GoogleFonts.poppins(
//                         color: Colors.red,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),

//                     SizedBox(height: 10.h),

//                     Text(
//                       news.title,
//                       style: GoogleFonts.poppins(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     SizedBox(height: 10.h),

//                     Text(
//                       news.time,
//                       style: GoogleFonts.poppins(color: Colors.grey),
//                     ),

//                     SizedBox(height: 20.h),

//                     Text(
//                       news.description,
//                       style: GoogleFonts.poppins(fontSize: 14.sp),
//                     ),
//                   ],
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'news_model.dart';
import 'package:doctor_app/router/app_routes.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsModel news = Get.arguments;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45.r),
                    bottomRight: Radius.circular(45.r),
                  ),
                  child: Image.network(
                    news.image,
                    width: double.infinity,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 15.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColor.white),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),

                Positioned(
                  top: 20.h,
                  right: 70.w,
                  child: IconButton(
                    icon: const Icon(Icons.share, color: AppColor.white),
                    onPressed: () {
                      Share.share("${news.title}\n\n${news.description}");
                    },
                  ),
                ),
                Positioned(
                  top: 20.h,
                  right: 15.w,
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColor.white,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.bookmarks_outlined,
                        color: AppColor.black,
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.account, arguments: news);
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.category,
                    style: GoogleFonts.poppins(
                      color: AppColor.redColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 13.h),
                  Text(
                    news.title,
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14.sp, color: Colors.grey),
                      SizedBox(width: 5.w),

                      Text(
                        news.time,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h),
                  Text(
                    news.description,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
