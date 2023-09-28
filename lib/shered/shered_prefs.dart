import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // static SharedPreferences? prefs;
  // static init() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  static addBoolToSF({required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    print('We save isDark is: $value');
  }

  static dynamic getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('darkMode') ?? false;

    return boolValue;
  }
}
