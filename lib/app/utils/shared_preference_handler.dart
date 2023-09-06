import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../assets/exporter/importer_app_general.dart';

class SharedPreferenceHandler {
  static SharedPreferences? _sharedPreferences;
  static const spUser = 'userInfo';
  static const spAccessToken = 'accessToken';
  static const spRefreshToken = 'refreshToken';
  static const spLanguage = "language";
  static const spJailBroken = 'rootDetectionJailBroken';
  static const spDeveloperMode = 'rootDetectionDeveloperMode';
  static const spTabletMode = 'tabletMode';

  static Future<SharedPreferences> getSharedPreference() async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static void logout() {
    _sharedPreferences?.remove(spUser);
    _sharedPreferences?.remove(spAccessToken);
    _sharedPreferences?.remove(spRefreshToken);
  }

  static void putUser(String user) {
    _sharedPreferences?.setString(spUser, user);
  }

  static UserModel? getUser() {
    try {
      final userInfo = _sharedPreferences?.getString(spUser) ?? '';

      if (userInfo.isNotEmpty) {
        final userMap = jsonDecode(userInfo) as Map<String, dynamic>;
        return UserModel.fromJson(userMap);
      }
      return null;
    } catch (e) {
      debugPrint('error: $e');
    }
    return null;
  }

  static void putAccessToken(String? token) {
    _sharedPreferences?.setString(spAccessToken, token ?? '');
  }

  static void putRefreshToken(String? token) {
    _sharedPreferences?.setString(spRefreshToken, token ?? '');
  }

  static void putLanguage(String? language) {
    _sharedPreferences?.setString(spLanguage, language ?? '');
  }

  static void putRootDetectionJailBroken(bool jailBroken) {
    _sharedPreferences?.setBool(spJailBroken, jailBroken);
  }

  static void putRootDetectionDeveloperMode(bool developerMode) {
    _sharedPreferences?.setBool(spDeveloperMode, developerMode);
  }

  static void putIsTablet(bool isTablet) {
    _sharedPreferences?.setBool(spTabletMode, isTablet);
  }

  static String getAccessToken() {
    return _sharedPreferences?.getString(spAccessToken) ?? '';
  }

  static String getRefreshToken() {
    return _sharedPreferences?.getString(spRefreshToken) ?? '';
  }

  static String getLanguage() {
    return _sharedPreferences?.getString(spLanguage) ?? '';
  }

  static bool getRootDetectionJailBroken() {
    return _sharedPreferences?.getBool(spJailBroken) ?? false;
  }

  static bool getRootDetectionDeveloperMode() {
    return _sharedPreferences?.getBool(spDeveloperMode) ?? false;
  }

  static bool getIsTablet() {
    return _sharedPreferences?.getBool(spTabletMode) ?? false;
  }
}
