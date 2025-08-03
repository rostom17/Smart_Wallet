part of 'get_all_expense_cubit.dart';

sealed class GetAllExpenseState {}

class GetAllExpenseInital extends GetAllExpenseState {}

class GetAllExpenseLoading extends GetAllExpenseState {}

class GetAllExpenseSuccessfull extends GetAllExpenseState {
  final List<ExpenseEntity> expenseList;
  GetAllExpenseSuccessfull({required this.expenseList});
}

class GetAllExpenseFailed extends GetAllExpenseState {
  final ApiError error;
  GetAllExpenseFailed({required this.error});
}
