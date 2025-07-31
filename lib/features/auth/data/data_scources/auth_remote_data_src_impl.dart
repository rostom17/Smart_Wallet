import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_wallet/core/constants/api_constants.dart';
import 'package:smart_wallet/core/network/models/network_request_model.dart';
import 'package:smart_wallet/core/network/models/network_response_model.dart';
import 'package:smart_wallet/core/network/network_executor.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_remote_data_src.dart';
import 'package:smart_wallet/features/auth/data/models/user_model.dart';
import 'package:smart_wallet/features/shared/domain/entities/api_error.dart';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  final NetworkExecutor networkExecutor;
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  AuthRemoteDataSrcImpl({
    required this.networkExecutor,
    required this.secureStorage,
    required this.sharedPreferences,
  });

  @override
  Future<Either<ApiError, UserModel>> login({
    required String email,
    required String password,
  }) async {
    final formData = {"email": email, "password": password};
    final NetworkResponseModel response = await networkExecutor.postRequest(
      NetworkRequsetModel(path: ApiConstants.loginEndPoint, body: formData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.bodyData["accessToken"]);
      return Right(UserModel.fromJson(response.bodyData['user']));
    } else {
      return Left(
        ApiError(errorMessage: "${response.statusCode}: ${response.message}"),
      );
    }
  }

  @override
  Future<Either<ApiError, UserModel>> signup({
    required String userName,
    required String email,
    required String password,
  }) async {
    return left(ApiError(errorMessage: "Implemet firstr"));
  }
}
