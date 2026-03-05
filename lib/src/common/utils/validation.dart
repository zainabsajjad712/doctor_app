class Validation {
  static String? fieldValidation(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter email';
    }

    final email = value.trim();
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,}$');

    if (!regex.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    final name = value.trim();

    if (name.length < 3) {
      return 'Name is too short';
    }

    final regex = RegExp(r'^[a-zA-Z ]+$');
    if (!regex.hasMatch(name)) {
      return 'Name should contain only letters';
    }

    return null;
  }

  static String? dobValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select your date of birth';
    }

    try {
      // Expected format: DD/MM/YYYY
      final parts = value.trim().split('/');
      if (parts.length != 3) return 'Invalid date format (DD/MM/YYYY)';

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final dob = DateTime(year, month, day);

      // Invalid dates like 31/02/2024
      if (dob.day != day || dob.month != month || dob.year != year) {
        return 'Invalid date';
      }

      if (dob.isAfter(DateTime.now())) {
        return 'Future date is not allowed';
      }

      // Age check
      int age = DateTime.now().year - dob.year;
      if (DateTime.now().month < dob.month ||
          (DateTime.now().month == dob.month && DateTime.now().day < dob.day)) {
        age--;
      }

      if (age < 18) {
        return 'Age must be 18+';
      }

      return null;
    } catch (_) {
      return 'Invalid date';
    }
  }

  // static String? passwordValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters';
  //   }
  //   if (!value.contains(RegExp(r'[A-Z]'))) {
  //     return 'Password must contain at least 1 uppercase letter';
  //   }
  //   if (!value.contains(RegExp(r'[a-z]'))) {
  //     return 'Password must contain at least 1 lowercase letter';
  //   }
  //   if (!value.contains(RegExp(r'[0-9]'))) {
  //     return 'Password must contain at least 1 digit';
  //   }
  //   if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //     return 'Password must contain at least 1 special character';
  //   }
  //   return null;
  // }
  static String? passwordValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter password';
    }

    final v = value.trim();

    // Only digits + exactly 6
    if (!RegExp(r'^\d{6}$').hasMatch(v)) {
      return 'Password must be exactly 6 digits';
    }

    return null;
  }

  static String? confirmPasswordValidation(String? value, String original) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter confirm password';
    }

    final confirm = value.trim();
    final pass = original.trim();

    // Optional: validate confirm format too (same 6 digits rule)
    if (!RegExp(r'^\d{6}$').hasMatch(confirm)) {
      return 'Confirm password must be exactly 6 digits';
    }

    if (confirm != pass) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? phoneNumberValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter phone number';
    }

    // Format example: +923001234567
    final regex = RegExp(r'^\+\d{1,3}\d{10,14}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Invalid phone number format (e.g. +923001234567)';
    }

    return null;
  }

  static String? cardNumberValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter card number';
    }

    // Format: 1234 5678 9012 3456
    final regex = RegExp(r'^\d{4}\s\d{4}\s\d{4}\s\d{4}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid card number (#### #### #### ####)';
    }

    return null;
  }

  static String? expiryDateValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter expiry date';
    }

    // Format: MM/YY
    final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid expiry date (MM/YY)';
    }

    return null;
  }

  static String? cvvValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter CVV';
    }

    final regex = RegExp(r'^\d{3}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid CVV (3 digits)';
    }

    return null;
  }

  static String? numberValidation(
    String? value, {
    String fieldName = "number",
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }

    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid $fieldName (digits only)';
    }

    return null;
  }

  static String? ageValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter age';
    }

    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid age';
    }

    final age = int.parse(value.trim());
    if (age < 0 || age > 30) {
      return 'Age must be between 0 and 30';
    }

    return null;
  }

  static String? weightValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter weight';
    }

    final regex = RegExp(r'^\d+(\.\d+)?$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid weight';
    }

    final weight = double.parse(value.trim());
    if (weight < 0 || weight > 200) {
      return 'Weight must be between 0 and 200';
    }

    return null;
  }
}
