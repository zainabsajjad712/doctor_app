// import 'package:shared_preferences/shared_preferences.dart';

// class AuthManager {
//   static const String keyLoggedIn = "loggedIn";
//   static const String keyFirstTime = "firstTime";
//   static const String keyToken = "token";

//   static Future<bool> isLoggedIn() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(keyLoggedIn) ?? false;
//   }

//   static Future<void> login() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(keyLoggedIn, true);
//   }

//   static Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(keyLoggedIn, false);
//     await prefs.remove(keyToken);
//   }

//   static Future<bool> isFirstTime() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(keyFirstTime) ?? true;
//   }

//   static Future<void> completeOnboarding() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(keyFirstTime, false);
//   }

//   static Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(keyToken, token);
//   }

//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(keyToken);
//   }
// }
