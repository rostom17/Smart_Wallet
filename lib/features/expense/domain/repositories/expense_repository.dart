import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<Either<ApiError, List<ExpenseEntity>>> getAllExpenses();
  Future<Either<ApiError, ExpenseEntity>> addNewExpense();
  Future<Either<ApiError, ExpenseEntity>> updateExpense();
}
