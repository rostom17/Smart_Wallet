import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wallet/core/constants/app_secrets.dart';
import 'package:smart_wallet/features/common/data/models/user_model.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/profile/data/datasources/profile_local_data_src.dart';

class ProfileLocalDataSrcImpl extends ProfileLocalDataSrc {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSrcImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  });

  final String accessTokenKey = AppSecrets.accessTokenKey;
  final String userDataKey = AppSecrets.userDataKey;

  @override
  Future<Either<ApiError, bool>> deleteSavedData() async {
    try {
      await secureStorage.delete(key: accessTokenKey);
      await sharedPreferences.remove(userDataKey);
      final apiKey = await secureStorage.read(key: accessTokenKey);
      if (apiKey == null) {
        return Right(true);
      } else {
        return Right(false);
      }
    } catch (e) {
      return Left(ApiError(errorMessage: "$e"));
    }
  }

  @override
  Future<Either<ApiError, UserModel>> getCurrentUserFromLocal() async {
    try {
      final userJson = sharedPreferences.getString(userDataKey);
      if (userJson == null) {
        return Left(
          ApiError(
            errorMessage: "Failed to get User data.! Please login again",
          ),
        );
      } else {
        final user = jsonDecode(userJson);
        return Right(UserModel.fromJson(user));
      }
    } catch (e) {
      return Left(
        ApiError(errorMessage: "Failed to get user data with error: $e"),
      );
    }
  }
}
