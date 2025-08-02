import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_local_data_src.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_remote_data_src.dart';
import 'package:smart_wallet/features/auth/data/models/login_request_model.dart';
import 'package:smart_wallet/features/auth/data/models/signup_request_model.dart';
import 'package:smart_wallet/features/auth/domain/entities/auth_entity.dart';
import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSrc authRemoteDataSrc;
  final AuthLocalDataSrc authLocalDataSrc;

  AuthRepositoryImpl({
    required this.authRemoteDataSrc,
    required this.authLocalDataSrc,
  });

  @override
  Future<Either<ApiError, AuthEntity>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    final response = await authRemoteDataSrc.login(
      loginRequestModel: loginRequestModel,
    );
    return response.fold(
      (error) {
        return Left(error);
      },
      (authModel) {
        authLocalDataSrc.saveAuthToken(authModel.accessTokenModel);
        authLocalDataSrc.saveUserData(authModel.userModel);
        return Right(authModel.toEntity());
      },
    );
  }

  @override
  Future<Either<ApiError, AuthEntity>> signup({
    required SignupRequestModel signupRequestModel,
  }) async {
    final response = await authRemoteDataSrc.signup(
      signupRequestModel: signupRequestModel,
    );
    return response.fold((error) => Left(error), (authModel) {
      authLocalDataSrc.saveAuthToken(authModel.accessTokenModel);
      authLocalDataSrc.saveUserData(authModel.userModel);
      return Right(authModel.toEntity());
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    final authToken = await authLocalDataSrc.getAuthToken();
    if (authToken == null) {
      return false;
    } else {
      return true;
    }
  }

}
