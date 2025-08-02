import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

abstract class ProfileRepository {
  Future<Either<ApiError, bool>> logout();
  Future<Either<ApiError, UserEntity>> getCurrentUser();
}
