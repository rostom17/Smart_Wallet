import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/profile/data/datasources/profile_local_data_src.dart';
import 'package:smart_wallet/features/profile/data/datasources/profile_remote_data_src.dart';
import 'package:smart_wallet/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileLocalDataSrc localDataSrc;
  final ProfileRemoteDataSrc remoteDataSrc;
  ProfileRepositoryImpl({
    required this.localDataSrc,
    required this.remoteDataSrc,
  });

  @override
  Future<Either<ApiError, bool>> logout() async {
    try {
      final result = await localDataSrc.deleteSavedData();
      return result.fold((error) => Left(error), (success) => Right(success));
    } catch (e) {
      return Left(ApiError(errorMessage: "Unexpected Logout Error occured"));
    }
  }

  @override
  Future<Either<ApiError, UserEntity>> getCurrentUser() async {
    try {
      // First try to get user from local storage
      final localUserResult = await localDataSrc.getCurrentUserFromLocal();

      return await localUserResult.fold((localError) async {
        // If local fails, try remote
        final remoteUserResult = await remoteDataSrc.getCurrentUserFromRemote();
        return remoteUserResult.fold(
          (remoteError) => Left(remoteError),
          (remoteUser) => Right(remoteUser.toEntity()),
        );
      }, (localUser) => Right(localUser.toEntity()));
    } catch (e) {
      return Left(ApiError(errorMessage: "$e:Failed to fetch user data"));
    }
  }
}
