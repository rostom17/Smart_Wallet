import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/expense/data/models/expense_model.dart';
import 'package:smart_wallet/features/expense/domain/repositories/expense_repository.dart';

class UpdateExpenseUsecase
    implements Usecase<Either<ApiError, String>, UpdateExpenseParameters> {
  final ExpenseRepository expenseRepository;

  UpdateExpenseUsecase({required this.expenseRepository});

  @override
  Future<Either<ApiError, String>> call(UpdateExpenseParameters params) async {
    return await expenseRepository.updateExpense(
      expenseModel: ExpenseModel(
        id: params.id,
        title: params.title,
        amount: params.amount,
        date: DateTime.tryParse(params.date),
      ),
    );
  }
}

class UpdateExpenseParameters {
  final int id;
  final String title;
  final double amount;
  final String date;

  UpdateExpenseParameters({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
