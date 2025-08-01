import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/models/auth_model.dart';
import 'package:smart_wallet/features/auth/data/models/login_request_model.dart';
import 'package:smart_wallet/features/auth/data/models/signup_request_model.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

abstract class AuthRemoteDataSrc {
  Future<Either<ApiError, AuthModel>> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<Either<ApiError, AuthModel>> signup({
    required SignupRequestModel signupRequestModel,
  });
}
