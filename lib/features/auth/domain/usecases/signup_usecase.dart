import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/shared/domain/entities/api_error.dart';
import 'package:smart_wallet/features/shared/domain/usecases/usecase.dart';

class SignupUseCase
    implements Usecase<Either<ApiError, UserEntity>, UserSignupParameters> {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<Either<ApiError, UserEntity>> call(UserSignupParameters params) async {
    return await authRepository.signup(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignupParameters {
  final String name;
  final String email;
  final String password;

  UserSignupParameters({
    required this.name,
    required this.email,
    required this.password,
  });
}
