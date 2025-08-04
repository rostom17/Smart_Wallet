
part of 'update_expense_cubit.dart';

sealed class UpdateExpenseState {}

class UpdateExpenseInitial extends UpdateExpenseState {}

class UpdateExpenseLoading extends UpdateExpenseState {}

class UpdateExpenseSuccessful extends UpdateExpenseState {
  final String successMessage;

  UpdateExpenseSuccessful({required this.successMessage});
}

class UpdateExpesneFailed extends UpdateExpenseState {
  final ApiError errorMesssage;

  UpdateExpesneFailed({required this.errorMesssage});
}
