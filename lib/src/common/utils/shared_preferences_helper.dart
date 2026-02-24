// import 'package:doctor_app/src/common/constant/static_data.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// const String isSellerOnboardedText = 'isSellerOnboarded';

// class SharedPrefHelper {
//   static late SharedPreferences _prefs;

//   // Initialize SharedPreferences and StaticData
//   static Future<void> getInitialValue() async {
//     _prefs = await SharedPreferences.getInstance();
//     StaticData.isFirstTime = getBool(isFirstTimeText) ?? true;
//     StaticData.isBuyer = getBool(isBuyerText) ?? true;
//     StaticData.isLoggedIn = getBool(isLoggedInText) ?? false;
//     StaticData.isSellerOnboarded = getBool(isSellerOnboardedText) ?? false;
//     StaticData.email = getString(emailText) ?? '';
//   }

//   // Save a boolean value and update StaticData
//   static Future<void> saveBool(String key, bool value) async {
//     await _prefs.setBool(key, value);

//     // Update StaticData
//     if (key == isBuyerText) {
//       StaticData.isBuyer = value;
//     }
//     if (key == isLoggedInText) {
//       StaticData.isLoggedIn = value;
//     }
//     if (key == isSellerOnboardedText) {
//       StaticData.isSellerOnboarded = value;
//     }
//   }

//   // Retrieve a boolean value
//   static bool? getBool(String key) {
//     return _prefs.getBool(key);
//   }

//   // Add this method for retrieving a string value
//   static String? getString(String key) {
//     return _prefs.getString(key);
//   }

//   // Save a string value
//   static Future<void> saveString(String key, String value) async {
//     await _prefs.setString(key, value);
//   }
// }
