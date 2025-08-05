import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';
import 'package:smart_wallet/features/wallet/domain/repositories/wallet_repository.dart';

class GetAllCardUsecase
    implements Usecase<Either<ApiError, List<CardEntity>>, NoParams> {
  final WalletRepository walletRepository;

  GetAllCardUsecase({required this.walletRepository});

  @override
  Future<Either<ApiError, List<CardEntity>>> call(NoParams params) async {
    return await walletRepository.getAllCards();
  }
}
