import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';
import 'package:smart_wallet/features/expense/domain/usecases/add_expense_usecase.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  final AddExpenseUsecase addExpenseUsecase;
  AddExpenseCubit({required this.addExpenseUsecase})
    : super(AddExpenseInital());

  Future<void> addExpense({
    required String title,
    required double amount,
    required String dateTime,
  }) async {
    emit(AddExpenseLoading());
    final response = await addExpenseUsecase.call(
      AddExpeseParameters(title: title, amount: amount, date: dateTime),
    );
    response.fold(
      (failed) => emit(AddExpenseFailed(error: failed)),
      (expense) => emit(AddExpnseSuccessful(expenseEntity: expense)),
    );
  }
}
