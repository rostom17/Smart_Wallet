import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/wallet/data/datascource/card_remote_data_src.dart';
import 'package:smart_wallet/features/wallet/data/models/new_card_request_model.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';
import 'package:smart_wallet/features/wallet/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final CardRemoteDataSrc cardRemoteDataSrc;

  WalletRepositoryImpl({required this.cardRemoteDataSrc});

  @override
  Future<Either<ApiError, List<CardEntity>>> getAllCards() async {
    final response = await cardRemoteDataSrc.getAllCards();
    return response.fold((error) => Left(error), (cardModelList) {
      List<CardEntity> cardEntityList = cardModelList
          .map((e) => e.toEntity())
          .toList();
      return Right(cardEntityList);
    });
  }

  @override
  Future<Either<ApiError, CardEntity>> addNewCard({
    required NewCardRequestModel newCardModel,
  }) async {
    final response = await cardRemoteDataSrc.addNewCard(
      newCardModel: newCardModel,
    );

    return response.fold(
      (error) => Left(error),
      (cardModel) => Right(cardModel.toEntity()),
    );
  }
}
