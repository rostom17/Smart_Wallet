import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/models/user_model.dart';
import 'package:smart_wallet/features/shared/domain/entities/api_error.dart';

abstract class AuthRemoteDataSrc {
  Future<Either<ApiError, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ApiError, UserModel>> signup({
    required String userName,
    required String email,
    required String password,
  });
}
