import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/usecases/usecase.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';
import 'package:smart_wallet/features/expense/domain/repositories/expense_repository.dart';

class GetAllExpenseUsecase
    implements Usecase<Either<ApiError, List<ExpenseEntity>>, NoParams> {
  final ExpenseRepository expenseRepository;
  GetAllExpenseUsecase({required this.expenseRepository});

  @override
  Future<Either<ApiError, List<ExpenseEntity>>> call(NoParams params) async {
    return await expenseRepository.getAllExpenses();
  }
}
