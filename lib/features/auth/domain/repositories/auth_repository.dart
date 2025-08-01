import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/models/login_request_model.dart';
import 'package:smart_wallet/features/auth/data/models/signup_request_model.dart';

import 'package:smart_wallet/features/auth/domain/entities/auth_entity.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

abstract class AuthRepository {
  Future<Either<ApiError, AuthEntity>> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<Either<ApiError, AuthEntity>> signup({
    required SignupRequestModel signupRequestModel,
  });

  Future<Either<ApiError, void>> logout();

  Future<Either<ApiError, UserEntity>> fetchUserData();

  Future<bool> isLoggedIn();
}
