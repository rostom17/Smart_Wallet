import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';

abstract class WalletRepository {
  Future<Either<ApiError, List<CardEntity>>> getAllCards();
}
