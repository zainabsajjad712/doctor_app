import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:doctor_app/src/common/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'phone_controller.dart';

class PhoneView extends GetView<PhoneController> {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              // ✅ Upper content (slightly upper than center)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    // Icon
                    Image.asset(AppImages.phone, height: 200),

                    const SizedBox(height: 26),

                    // TextField
                    CustomPhoneField(
                      controller: controller.phoneController,
                      onChanged: controller.onPhoneChanged,
                      validator: (phone) {
                        if (phone == null || phone.number.trim().isEmpty) {
                          return 'Enter phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Terms
                    Text(
                      'You agree to our terms and conditions of use by clicking\n'
                      'the "continue" button.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ Bottom button (ALWAYS bottom)
              Obx(() {
                final loading = controller.isLoading.value;

                return SizedBox(
                  width: w,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: loading ? null : controller.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;

  // ✅ IntlPhoneField expects: String? Function(PhoneNumber?)?
  final String? Function(PhoneNumber?)? validator;

  final Function(String completeNumber)? onChanged;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: 'PK',
      keyboardType: TextInputType.phone,
      disableLengthCheck: false,

      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),

      decoration: InputDecoration(
        hintText: 'Your phone number',
        hintStyle: const TextStyle(color: Colors.black38),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.4),
        ),
      ),

      onChanged: (phone) {
        if (onChanged != null) onChanged!(phone.completeNumber);
      },

      // ✅ now correct type
      validator: validator,
    );
  }
}
