// Obtain shared preferences.

import 'package:sampleapp/constant/shared_preference_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> savePrimaryAccountNumber(String primaryNumber) async {
  final prefs = await SharedPreferences.getInstance();
  bool isSave = await prefs.setString(
      SharedPreferenceConstant.PRIMARY_NUMBER_KEY, primaryNumber);
  return isSave;
}
