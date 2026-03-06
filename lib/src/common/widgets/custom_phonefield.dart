import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart' show IntlPhoneField;
import 'package:intl_phone_field/phone_number.dart';

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
