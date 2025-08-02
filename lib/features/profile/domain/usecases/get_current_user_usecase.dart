import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentUserUsecase
    implements Usecase<Either<ApiError, UserEntity>, NoParams> {
  final ProfileRepository profileRepository;

  GetCurrentUserUsecase({required this.profileRepository});

  @override
  Future<Either<ApiError, UserEntity>> call(NoParams params) async {
    return await profileRepository.getCurrentUser();
  }
}
