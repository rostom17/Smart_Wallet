part of 'add_expense_cubit.dart';



sealed class AddExpenseState {}

class AddExpenseInital extends AddExpenseState{}

class AddExpenseLoading extends AddExpenseState {}

class AddExpnseSuccessful extends AddExpenseState {
  final ExpenseEntity expenseEntity;

  AddExpnseSuccessful({required this.expenseEntity});
}

class AddExpenseFailed extends AddExpenseState {
  final ApiError error;

  AddExpenseFailed ({required this.error});
}