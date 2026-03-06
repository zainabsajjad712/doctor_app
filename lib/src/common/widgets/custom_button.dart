import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isLoading; // ✅ Added

  final double? textSize;
  final double? letterSpacing;
  final double? borderRadius;
  final double? elevation;
  final Color? textColor;
  final FontWeight? fontWeight;
  final List<Color>? gradientColors;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool isIconRight;
  final Color? borderColor;
  final double? borderWidth;

  static const Color primaryButton = Color(0xFF2673FF);

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false, // ✅ default
    this.elevation,
    this.textColor,
    this.fontWeight,
    this.textSize,
    this.letterSpacing,
    this.borderRadius,
    this.gradientColors,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isIconRight = false,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.h,
      width: width ?? MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap, // ✅ disable when loading
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: EdgeInsets.zero,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: borderWidth ?? 1)
                : BorderSide.none,
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? primaryButton,
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
          child: Container(
            alignment: Alignment.center,
            child: isLoading
                ? SizedBox(
                    width: 22.w,
                    height: 22.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                : (isIconRight
                      ? _buildTextWithIcon(context)
                      : _buildIconWithText(context)),
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithText(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: iconSize ?? 20, color: iconColor ?? AppColor.white),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: GoogleFonts.openSans(
            color: textColor ?? AppColor.white,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: textSize ?? 17,
            letterSpacing: letterSpacing ?? 1.25,
          ),
        ),
      ],
    );
  }

  Widget _buildTextWithIcon(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: GoogleFonts.openSans(
            color: textColor ?? AppColor.white,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: textSize ?? 14,
          ),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(icon, size: iconSize ?? 20, color: iconColor ?? AppColor.white),
        ],
      ],
    );
  }
}
