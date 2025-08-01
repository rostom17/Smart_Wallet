import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_remote_data_src.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/repositories/auth_repository.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSrc authRemoteDataSrc;

  AuthRepositoryImpl({required this.authRemoteDataSrc});

  @override
  Future<Either<ApiError, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final respponse = await authRemoteDataSrc.login(
      email: email,
      password: password,
    );
    return respponse.fold(
      (error) => Left(error),
      (user) => Right(user.toEntity()),
    );
  }

  @override
  Future<Either<ApiError, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
