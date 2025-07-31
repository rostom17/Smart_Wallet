import 'package:dartz/dartz.dart';

import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/shared/domain/entities/api_error.dart';
import 'package:smart_wallet/features/shared/domain/usecases/usecase.dart';

class LoginUseCase
    implements Usecase<Either<ApiError, UserEntity>, UserLoginParameters> {
  LoginUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<ApiError, UserEntity>> call(UserLoginParameters params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParameters {
  final String email;
  final String password;
  UserLoginParameters({required this.email, required this.password});
}
