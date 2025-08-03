import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/expense/data/models/expense_model.dart';

abstract class ExpenseRemoteDataSource {
  Future<Either<ApiError, List<ExpenseModel>>> getAllExpenses();
}
