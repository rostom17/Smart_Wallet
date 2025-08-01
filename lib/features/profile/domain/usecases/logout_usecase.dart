import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/profile/domain/repositories/profile_repository.dart';

class LogoutUsecase implements Usecase<Either<ApiError, void>, NoParams> {
  final ProfileRepository profileRepository;

  LogoutUsecase({required this.profileRepository});

  @override
  Future<Either<ApiError, bool>> call(NoParams params) async {
    return await profileRepository.logout();
  }
}
