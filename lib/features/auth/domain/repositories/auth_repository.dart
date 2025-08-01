import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

abstract class AuthRepository {
  Future<Either<ApiError, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<ApiError, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  });
}
