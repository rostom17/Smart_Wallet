import 'package:smart_wallet/features/auth/data/models/access_token_model.dart';
import 'package:smart_wallet/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSrc {
  Future<void> saveAuthToken(AccessTokenModel accessTokenModel);
  Future<void> saveUserData(UserModel userModel);
  Future<String?> getAuthToken();
  Future<UserModel?> getUserData();
  Future<void> clearSavedData();
}
