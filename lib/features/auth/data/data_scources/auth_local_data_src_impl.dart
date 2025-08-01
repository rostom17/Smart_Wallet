import 'dart:convert';

import 'package:smart_wallet/core/services/service_locator.dart';
import 'package:smart_wallet/features/auth/data/models/access_token_model.dart';
import 'package:smart_wallet/features/auth/data/models/user_model.dart';

class AuthLocalDataSrcImpl implements AuthLocalDataSrc {
  static const String accessTokenKey = "access-token";
  static const String userDataKey = "user-data";

  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  AuthLocalDataSrcImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  });

  @override
  Future<void> clearSavedData() async {
    await secureStorage.delete(key: userDataKey);
    await sharedPreferences.remove(userDataKey);
  }

  @override
  Future<String?> getAuthToken() async {
    return await secureStorage.read(key: accessTokenKey);
  }

  @override
  Future<UserModel?> getUserData() async {
    final jsonString = sharedPreferences.getString(userDataKey);
    if (jsonString == null) return null;
    try {
      final user = jsonDecode(jsonString);
      return UserModel.fromJson(user);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveAuthToken(AccessTokenModel accessTokenModel) async {
    await secureStorage.write(
      key: accessTokenKey,
      value: accessTokenModel.accessToken,
    );
  }

  @override
  Future<void> saveUserData(UserModel userModel) async {
    final jsonString = jsonEncode(userModel.toJson());
    await sharedPreferences.setString(userDataKey, jsonString);
  }
}
