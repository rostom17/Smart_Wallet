import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/data/models/user_model.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

abstract class ProfileRemoteDataSrc {
  Future<Either<ApiError, UserModel>> getCurrentUserFromRemote();
}
