import 'package:dartz/dartz.dart';
import 'package:smart_wallet/core/constants/api_constants.dart';
import 'package:smart_wallet/core/network/models/network_request_model.dart';
import 'package:smart_wallet/core/network/models/network_response_model.dart';
import 'package:smart_wallet/core/network/network_executor.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/wallet/data/datascource/card_remote_data_src.dart';
import 'package:smart_wallet/features/wallet/data/models/card_model.dart';

class CardRemoteDataSrcImpl implements CardRemoteDataSrc {
  final NetworkExecutor networkExecutor;

  CardRemoteDataSrcImpl({required this.networkExecutor});

  @override
  Future<Either<ApiError, List<CardModel>>> getAllCards() async {
    final NetworkResponseModel response = await networkExecutor.getRequest(
      NetworkRequsetModel(path: ApiConstants.bankCardEndPoint),
    );

    if (response.statusCode == 200) {
      final List<CardModel> cardList = [];
      for (Map<String, dynamic> card in response.bodyData) {
        cardList.add(CardModel.fromJson(card));
      }
      return Right(cardList);
    } else {
      return Left(ApiError(errorMessage: response.message));
    }
  }
}
