import 'package:dartz/dartz.dart';

import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';

class GetCurrentUserUsecase
    implements Usecase<Either<ApiError, UserEntity>, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUserUsecase({required this.authRepository});

  @override
  Future<Either<ApiError, UserEntity>> call(NoParams params) async {
    return await authRepository.fetchUserData();
  }
}
