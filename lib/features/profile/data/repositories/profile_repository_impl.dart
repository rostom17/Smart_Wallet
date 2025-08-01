import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/profile/data/datasources/profile_local_data_src.dart';
import 'package:smart_wallet/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileLocalDataSrc localDataSrc;
  ProfileRepositoryImpl({required this.localDataSrc});

  @override
  Future<Either<ApiError, bool>> logout() async {
    try {
      final result = await localDataSrc.deleteSavedData();
      return result.fold((error) => Left(error), (success) => Right(success));
    } catch (e) {
      return Left(ApiError(errorMessage: "Unexpected Logout Error occured"));
    }
  }
}
