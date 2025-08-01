import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';

class LogoutUsecase implements Usecase<Either<ApiError, void>, NoParams> {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  @override
  Future<Either<ApiError, void>> call(NoParams params) async {
    return await authRepository.logout();
  }
}
