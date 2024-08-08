import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/app_keys.dart';

class LocalData {
  static late final SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> setIsLogin(bool isLogin) async {
    await _pref.setBool(AppKeys.isLogin, isLogin);
  }

  static bool getIsLogin() {
    return _pref.getBool(AppKeys.isLogin) ?? false;
  }

  static Future<void> setUsername(String? username) async {
    if (username == null) {
      await _pref.remove(AppKeys.username);
    } else {
      await _pref.setString(AppKeys.username, username);
    }
  }

  static String? getUsername() {
    return _pref.getString(AppKeys.username);
  }
}
