class Validation {
  static String? fieldValidation(String? value, String field) {
    if (value!.isEmpty) {
      return '${'please_enter'} $field';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!.trim())) {
      return 'enter_valid_email';
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'please_enter_password';
    }
    if (value.length < 6) {
      return 'at_least_six_characters';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'at_least_one_uppercase';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'at_least_one_lowercase';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'at_least_one_digit';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'at_least_one_special_character';
    }
    return null;
  }

  static String? confirmPassword(String? value, String confirm) {
    if (value != confirm) {
      return 'password_dont_match';
    } else if (passwordValidation(value) != null) {
      return passwordValidation(value);
    }
    return null;
  }

  static String? phoneNumberValidation(String? value) {
    if (value!.isEmpty) {
      return 'enter_ph_no';
    }
    RegExp regex = RegExp(r'^\+\d{1,3}\d{10,14}$');
    if (!regex.hasMatch(value)) {
      return 'invalid_ph_no_format';
    }
    return null;
  }

  static String? cardNumberValidation(String? value) {
    if (value!.isEmpty) {
      return 'enter_card_no';
    }
    RegExp regex = RegExp(r'^\d{4}\s\d{4}\s\d{4}\s\d{4}$');
    if (!regex.hasMatch(value)) {
      return 'enter_valid_card_no';
    }
    return null;
  }

  static String? expiryDateValidation(String? value) {
    if (value!.isEmpty) {
      return 'enter_expiry_date';
    }
    RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!regex.hasMatch(value)) {
      return 'enter_valid_expiry_date';
    }
    return null;
  }

  static String? cvvValidation(String? value) {
    if (value!.isEmpty) {
      return 'enter_cvv_no';
    }
    RegExp regex = RegExp(r'^\d{3}$');
    if (!regex.hasMatch(value)) {
      return 'enter_valid_cvv_no';
    }
    return null;
  }

  static String? numberValidation(String? value, {String field = "number"}) {
    if (value == null || value.isEmpty) {
      return '${'please_enter_a'} $field';
    }
    // Regular expression to check if the input is only digits
    RegExp regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value)) {
      return '${'please_enter_a_valid'} $field (${'only_digit'})';
    }
    return null;
  }

  static String? ageValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_age';
    }
    RegExp regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value)) {
      return 'please_enter_valid_age';
    }
    int age = int.parse(value);
    if (age < 0 || age > 30) {
      return 'age_must_be_between_0_and_30';
    }
    return null;
  }

  static String? weightValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please_enter_weight';
    }

    // Updated regex to allow decimal numbers
    RegExp regex = RegExp(r'^\d+(\.\d+)?$');
    if (!regex.hasMatch(value)) {
      return 'please_enter_valid_weight';
    }

    double weight = double.parse(value); // Parsing the value as a double
    if (weight < 0 || weight > 200) {
      return 'weight_must_be_between_0_and_200';
    }

    return null;
  }
}
