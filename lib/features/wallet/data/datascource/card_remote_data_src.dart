import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/wallet/data/models/card_model.dart';

abstract class CardRemoteDataSrc {
  Future<Either<ApiError, List<CardModel>>> getAllCards();
}
