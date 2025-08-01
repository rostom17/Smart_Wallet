import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_local_data_src.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_remote_data_src.dart';
import 'package:smart_wallet/features/auth/data/models/login_request_model.dart';
import 'package:smart_wallet/features/auth/data/models/signup_request_model.dart';
import 'package:smart_wallet/features/auth/domain/entities/auth_entity.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
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
  Future<bool> isLoggedIn() async {
    final authToken = await authLocalDataSrc.getAuthToken();
    if (authToken == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<ApiError, void>> logout() async {
    try {
      await authLocalDataSrc.clearSavedData();
      return const Right(null);
    } catch (e) {
      return Left(ApiError(errorMessage: "$e"));
    }
  }

  @override
  Future<Either<ApiError, AuthEntity>> signup({
    required SignupRequestModel signupRequestModel,
  }) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, UserEntity>> fetchUserData() async {
    print("fetching user repository implemnt is wokring");
    final userModel = await authLocalDataSrc.getUserData();
    if (userModel == null) {
      return Left(ApiError(errorMessage: "You are no Logged In"));
    }
    return Right(userModel.toEntity());
  }
}
