class ApiEndpoints {
  static const String baseUrl = 'https://api.petsypetz.com';

  // AUTH END POINTS
  static const String register = '$baseUrl/v1/auth/register';
  static const String login = '$baseUrl/v1/auth/login';
  static const String forgotPassword = '$baseUrl/v1/auth/forgot-password';
  static const String resetPassword = '$baseUrl/v1/auth/reset-password';
  static const String me = '$baseUrl/v1/auth/me';
  static const String logout = '$baseUrl/v1/auth/logout';
  //SETTINGS END POINTS
  static const String settings = '$baseUrl/v1/settings';
  // Device management (later use)
  static const String settingsDevices = '$baseUrl/v1/settings/devices';
  static String deleteDevice(String id) => '$baseUrl/v1/settings/devices/$id';
}
