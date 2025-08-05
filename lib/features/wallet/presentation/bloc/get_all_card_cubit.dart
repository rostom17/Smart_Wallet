import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';
import 'package:smart_wallet/features/wallet/domain/usecases/get_all_card_usecase.dart';

part 'get_all_cards_state.dart';

class GetAllCardCubit extends Cubit<GetAllCardsState> {
  final GetAllCardUsecase getAllCardUsecase;

  GetAllCardCubit({required this.getAllCardUsecase})
    : super(GetAllCardsInitial());

  Future<void> getAllCards() async {
    emit(GetAllCardsLoading());
    final response = await getAllCardUsecase.call(NoParams());
    response.fold(
      (error) => emit(GetAllCardsFailed(error: error)),
      (cardList) => emit(GetAllCardsSuccess(allCards: cardList)),
    );
  }
}
