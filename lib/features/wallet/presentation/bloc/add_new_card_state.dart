part of 'add_new_card_cubit.dart';

sealed class AddNewCardState {}

class AddNewCardInitial extends AddNewCardState {}

class AddNewCardLoading extends AddNewCardState {}

class AddNewCardFailed extends AddNewCardState {
  final ApiError error;

  AddNewCardFailed({required this.error});
}

class AddNewCardSuccess extends AddNewCardState {
  final CardEntity cardEntity;

  AddNewCardSuccess({required this.cardEntity});
}
