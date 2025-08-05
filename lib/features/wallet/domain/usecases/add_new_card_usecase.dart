import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/wallet/data/models/new_card_request_model.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';
import 'package:smart_wallet/features/wallet/domain/repositories/wallet_repository.dart';

class AddNewCardUsecase
    implements Usecase<Either<ApiError, CardEntity>, AddNewCardParameters> {
  final WalletRepository walletRepository;

  AddNewCardUsecase({required this.walletRepository});

  @override
  Future<Either<ApiError, CardEntity>> call(AddNewCardParameters params) async {
    return await walletRepository.addNewCard(
      newCardModel: NewCardRequestModel(
        holderName: params.holderName,
        cardNo: params.cardNo,
        cvc: params.cvc,
        expiryDate: params.expiryDate,
        cardTypeId: 1,
      ),
    );
  }
}

class AddNewCardParameters {
  final String holderName;
  final String cardNo;
  final String cvc;
  final String expiryDate;

  AddNewCardParameters({
    required this.holderName,
    required this.cardNo,
    required this.cvc,
    required this.expiryDate,
  });
}
