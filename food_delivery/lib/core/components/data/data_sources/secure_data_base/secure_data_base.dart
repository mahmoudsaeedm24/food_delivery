import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_delivery/core/components/data/models/user/user_model.dart';
import 'package:food_delivery/core/utils/keys.dart';

abstract class SecureDataBase {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> _storeUser(String userJson) async {
    await _secureStorage.write(key: Keys.userJsonKey, value: userJson);
    log("✅ User stored in local db");
  }

  static Future<UserModel?> getUserInfo() async {
    final String? userString = await _secureStorage.read(key: Keys.userJsonKey);
    if (userString != null) {
      return UserModel.fromString(userString);
    }
    return null;
  }

  static Future<void> storeToken(String token, String userJson) async {
    Future.wait([
      _secureStorage.write(key: Keys.tokenKey, value: token),
      _storeUser(userJson),
    ]);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: Keys.tokenKey);
  }

  static Future<void> removeToken() async {
    Future.wait([
      _secureStorage.delete(key: Keys.tokenKey),
      _secureStorage.delete(key: Keys.userJsonKey),
    ]);
  }
}
