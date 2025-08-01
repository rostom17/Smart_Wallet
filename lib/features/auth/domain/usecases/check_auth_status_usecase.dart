import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';

class CheckAuthStatusUsecase implements Usecase<bool, NoParams> {
  final AuthRepository authRepository;

  CheckAuthStatusUsecase({required this.authRepository});

  @override
  Future<bool> call(NoParams params) async {
    return await authRepository.isLoggedIn();
  }
}
