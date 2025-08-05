
part of 'get_all_card_cubit.dart';

class GetAllCardsState {}

class GetAllCardsInitial extends GetAllCardsState {}

class GetAllCardsLoading extends GetAllCardsState {}

class GetAllCardsFailed extends GetAllCardsState {
  final ApiError error;
  GetAllCardsFailed({required this.error});
}

class GetAllCardsSuccess extends GetAllCardsState {
  final List<CardEntity> allCards;

  GetAllCardsSuccess({required this.allCards});
}
