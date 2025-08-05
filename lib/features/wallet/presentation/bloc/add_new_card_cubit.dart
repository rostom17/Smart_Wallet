import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';
import 'package:smart_wallet/features/wallet/domain/usecases/add_new_card_usecase.dart';

part 'add_new_card_state.dart';

class AddNewCardCubit extends Cubit<AddNewCardState> {
  final AddNewCardUsecase addNewCardUsecase;

  AddNewCardCubit({required this.addNewCardUsecase})
    : super(AddNewCardInitial());

  Future<void> addNewCard({
    required String holderName,
    required String cardNo,
    required String cvc,
    required String expiryDate,
  }) async {
    emit(AddNewCardLoading());
    final response = await addNewCardUsecase.call(
      AddNewCardParameters(
        holderName: holderName,
        cardNo: cardNo,
        cvc: cvc,
        expiryDate: expiryDate,
      ),
    );

    response.fold(
      (error) => emit(AddNewCardFailed(error: error)),
      (cardEntity) => emit(AddNewCardSuccess(cardEntity: cardEntity)),
    );
  }
}
