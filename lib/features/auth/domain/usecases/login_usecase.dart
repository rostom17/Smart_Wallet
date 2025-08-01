import 'package:dartz/dartz.dart';

import 'package:smart_wallet/features/auth/data/models/login_request_model.dart';
import 'package:smart_wallet/features/auth/domain/entities/auth_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';

class LoginUseCase
    implements Usecase<Either<ApiError, AuthEntity>, UserLoginParameters> {
  LoginUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<ApiError, AuthEntity>> call(UserLoginParameters params) async {
    print("2. login usecase mehtod");
    return await authRepository.login(
      loginRequestModel: LoginRequestModel(
        email: params.email,
        password: params.password,
      ),
    );
  }
}

class UserLoginParameters {
  final String email;
  final String password;
  UserLoginParameters({required this.email, required this.password});
}
