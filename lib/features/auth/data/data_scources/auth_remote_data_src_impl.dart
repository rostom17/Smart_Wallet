import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_wallet/core/constants/api_constants.dart';
import 'package:smart_wallet/core/network/models/network_request_model.dart';
import 'package:smart_wallet/core/network/models/network_response_model.dart';
import 'package:smart_wallet/core/network/network_executor.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_remote_data_src.dart';
import 'package:smart_wallet/features/auth/data/models/auth_model.dart';
import 'package:smart_wallet/features/auth/data/models/login_request_model.dart';
import 'package:smart_wallet/features/auth/data/models/signup_request_model.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  final NetworkExecutor networkExecutor;

  AuthRemoteDataSrcImpl({required this.networkExecutor});

  @override
  Future<Either<ApiError, AuthModel>> signup({
    required SignupRequestModel signupRequestModel,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, AuthModel>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    print("4. auth remote data src impl method");
    final formData = {
      "email": loginRequestModel.email,
      "password": loginRequestModel.password,
    };
    final NetworkResponseModel response = await networkExecutor.postRequest(
      NetworkRequsetModel(path: ApiConstants.loginEndPoint, body: formData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.bodyData["accessToken"]);
      return Right(AuthModel.fromJson(response.bodyData));
    } else {
      return Left(
        ApiError(errorMessage: "${response.statusCode}: ${response.message}"),
      );
    }
  }
}
