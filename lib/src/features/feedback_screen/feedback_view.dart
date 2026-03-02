import 'package:doctor_app/src/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({super.key});

  static const _blue = Color(0xFF2673FF);
  static const _bg = Color(0xFFF6FAFF);
  static const _textDark = Color(0xFF111827);
  static const _textGrey = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,

      // ✅ bottom fixed button (third image)
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          child: CustomButton(onTap: () {}, text: 'Done', borderRadius: 16.r),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top blue header (first image)
            _Header(),

            // ✅ White card area (second + third image content)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _bg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 120.h),
                  child: Column(
                    children: [
                      Text(
                        "Thank you for using the online health\nconsultation service",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: _textDark,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "The results of the consultation will be sent to\nyou later. Please check your health records.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: _textGrey,
                          height: 1.35,
                        ),
                      ),

                      SizedBox(height: 26.h),

                      Text(
                        "Review the consultation",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                        ),
                      ),
                      SizedBox(height: 14.h),

                      // ✅ stars row (second image)
                      Obx(() {
                        final r = controller.rating.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (i) {
                            final idx = i + 1;
                            final filled = idx <= r;
                            return GestureDetector(
                              onTap: () => controller.setRating(idx),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Icon(
                                  filled
                                      ? Icons.star_rounded
                                      : Icons.star_border_rounded,
                                  size: 30.sp,
                                  color: const Color(0xFFFBBF24), // yellow
                                ),
                              ),
                            );
                          }),
                        );
                      }),

                      SizedBox(height: 18.h),

                      // ✅ feedback input
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: TextField(
                          controller: controller.feedbackCtrl,
                          maxLines: 5,
                          style: TextStyle(fontSize: 13.sp, color: _textDark),
                          decoration: InputDecoration(
                            hintText: "Your feedback",
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  static const _blue = Color(0xFF2673FF);
  static const _bg = Color(0xFFF6FAFF);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: Stack(
        children: [
          // Background (light)
          Positioned.fill(child: Container(color: _bg)),

          // ✅ Blue shape with rounded top + wave bottom
          Positioned.fill(
            child: ClipPath(
              clipper: _BlueWaveClipper(),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.r),
                  topRight: Radius.circular(22.r),
                ),
                child: Container(color: _blue),
              ),
            ),
          ),

          // tiny shapes
          Positioned(
            top: 56.h,
            left: 58.w,
            child: _TinyCircle(size: 10.w),
          ),
          Positioned(
            top: 78.h,
            left: 110.w,
            child: _TinyCircle(size: 12.w),
          ),
          Positioned(
            top: 92.h,
            right: 50.w,
            child: _TinyCircle(size: 9.w),
          ),
          Positioned(
            top: 70.h,
            right: 82.w,
            child: _TinyCircle(size: 8.w),
          ),
          Positioned(top: 86.h, left: 86.w, child: _TinyX()),
          Positioned(top: 62.h, right: 42.w, child: _TinyX()),
          Positioned(top: 74.h, left: 160.w, child: _TinyX()),
          Positioned(top: 98.h, right: 120.w, child: _TinyX()),

          // medal
          Positioned(
            left: 0,
            right: 0,
            bottom: 15.h,
            child: Center(child: _Medal()),
          ),
        ],
      ),
    );
  }
}

class _Medal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74.w,
      height: 74.w,
      decoration: BoxDecoration(
        color: const Color(0xFFFBBF24),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Center(
        child: Icon(Icons.star_rounded, size: 30.sp, color: Colors.white),
      ),
    );
  }
}

class _TinyCircle extends StatelessWidget {
  const _TinyCircle({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.85), width: 2),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _TinyX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "×",
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w900,
        color: Colors.white.withOpacity(0.85),
      ),
    );
  }
}

class _BlueWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    // Reference-like curve:
    final double leftY = h * 0.62; // where curve starts (left)
    final double dipY = h * 0.78; // center dip depth
    final double rightY = leftY; // end same height (right)

    final Path p = Path();

    // top rectangle
    p.moveTo(0, 0);
    p.lineTo(w, 0);
    p.lineTo(w, rightY);

    // smooth U curve back to left
    p.cubicTo(
      w * 0.78,
      h * 0.70, // control 1 (right slope)
      w * 0.62,
      dipY, // control 2 (towards dip)
      w * 0.50,
      dipY, // mid dip point
    );

    p.cubicTo(
      w * 0.38,
      dipY, // control 1 (from dip)
      w * 0.22,
      h * 0.70, // control 2 (left slope)
      0,
      leftY, // end at left
    );

    // close
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
