import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/expense/domain/usecases/update_expense_usecase.dart';

part 'update_expense_state.dart';

class UpdateExpenseCubit extends Cubit<UpdateExpenseState> {
  final UpdateExpenseUsecase updateExpenseUsecase;

  UpdateExpenseCubit({required this.updateExpenseUsecase})
    : super(UpdateExpenseInitial());

  Future<void> updateExpense({
    required int id,
    required String title,
    required double amount,
    required String date,
  }) async {
    emit(UpdateExpenseLoading());
    final response = await updateExpenseUsecase.call(
      UpdateExpenseParameters(id: id, title: title, amount: amount, date: date),
    );
    response.fold(
      (failed) => emit(UpdateExpesneFailed(errorMesssage: failed)),
      (successMessage) =>
          emit(UpdateExpenseSuccessful(successMessage: successMessage)),
    );
  }
}
