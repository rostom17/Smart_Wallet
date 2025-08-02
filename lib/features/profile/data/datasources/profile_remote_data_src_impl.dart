import 'package:dartz/dartz.dart';
import 'package:smart_wallet/core/constants/api_constants.dart';
import 'package:smart_wallet/core/network/models/network_request_model.dart';
import 'package:smart_wallet/core/network/models/network_response_model.dart';
import 'package:smart_wallet/core/services/service_locator.dart';
import 'package:smart_wallet/features/common/data/models/user_model.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

class ProfileRemoteDataSrcImpl implements ProfileRemoteDataSrc {
  final NetworkExecutor networkExecutor;

  ProfileRemoteDataSrcImpl({required this.networkExecutor});

  @override
  Future<Either<ApiError, UserModel>> getCurrentUserFromRemote() async {
    final NetworkResponseModel response = await networkExecutor.getRequest(
      NetworkRequsetModel(path: ApiConstants.userProfileEndPoint),
    );

    if (response.statusCode == 200) {
      return Right(UserModel.fromJson(response.bodyData));
    } else {
      return Left(ApiError(errorMessage: response.message));
    }
  }
}
