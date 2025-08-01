import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/models/signup_request_model.dart';
import 'package:smart_wallet/features/auth/domain/entities/auth_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';

class SignupUseCase
    implements Usecase<Either<ApiError, AuthEntity>, UserSignupParameters> {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<Either<ApiError, AuthEntity>> call(UserSignupParameters params) async {
    return await authRepository.signup(
      signupRequestModel: SignupRequestModel(
        email: params.email,
        password: params.password,
        userName: params.name,
      ),
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
