import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dumbdumb_flutter_app/app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHandler {
  static SharedPreferences? _sharedPreferences;
  static const spUser = 'userInfo';
  static const spAccessToken = 'accessToken';
  static const spRefreshToken = 'refreshToken';

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

  static String getAccessToken() {
    return _sharedPreferences?.getString(spAccessToken) ?? '';
  }

  static String getRefreshToken() {
    return _sharedPreferences?.getString(spRefreshToken) ?? '';
  }
}
