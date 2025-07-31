import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/models/user_model.dart';
import 'package:smart_wallet/features/shared/domain/entities/api_error.dart';

abstract class AuthLocalDataSrc {
  Future<Either<ApiError, void>> saveAuthToken(String token);
  Future<Either<ApiError, void>> saveUserData(UserModel user);
  Future<Either<ApiError, String?>> getAuthToken();
  Future<Either<ApiError, UserModel?>> getUserData();
  Future<Either<ApiError, void>> clearSavedData();
}
