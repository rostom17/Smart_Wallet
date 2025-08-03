import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/expense/data/models/expense_model.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';
import 'package:smart_wallet/features/expense/domain/repositories/expense_repository.dart';

class AddExpenseUsecase
    extends Usecase<Either<ApiError, ExpenseEntity>, AddExpeseParameters> {
  final ExpenseRepository expenseRepository;

  AddExpenseUsecase({required this.expenseRepository});

  @override
  Future<Either<ApiError, ExpenseEntity>> call(
    AddExpeseParameters params,
  ) async {
    // TODO: implement call
    return await expenseRepository.addExpense(
      expenseModel: ExpenseModel(
        id: null,
        title: params.title,
        amount: params.amount,
        date: DateTime.tryParse(params.date),
      ),
    );
  }
}

class AddExpeseParameters {
  final String title;
  final double amount;
  final String date;

  AddExpeseParameters({
    required this.title,
    required this.amount,
    required this.date,
  });
}
