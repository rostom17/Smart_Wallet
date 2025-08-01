import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

abstract class ProfileRepository {
  Future<Either<ApiError, bool>> logout();
}
