import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';
import 'package:smart_wallet/features/expense/domain/usecases/get_all_expense_usecase.dart';

part 'get_all_expense_state.dart';

class GetAllExpenseCubit extends Cubit<GetAllExpenseState> {
  GetAllExpenseCubit({required this.getAllExpenseUsecase})
    : super(GetAllExpenseInital());

  final GetAllExpenseUsecase getAllExpenseUsecase;

  Future<void> getAllExpense() async {
    emit(GetAllExpenseLoading());
    final response = await getAllExpenseUsecase.call(NoParams());
    response.fold((error) => emit(GetAllExpenseFailed(error: error)), (
      expenseList,
    ) {
      emit(GetAllExpenseSuccessfull(expenseList: expenseList.reversed.toList()));
    });
  }
}
