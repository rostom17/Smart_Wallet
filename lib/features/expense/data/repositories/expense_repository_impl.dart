import 'package:dartz/dartz.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/expense/data/datasource/expense_remote_data_src.dart';
import 'package:smart_wallet/features/expense/data/models/expense_model.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';
import 'package:smart_wallet/features/expense/domain/repositories/expense_repository.dart';

class ExpenseRepositoryImpl extends ExpenseRepository {
  final ExpenseRemoteDataSource expenseRemoteDataSource;

  ExpenseRepositoryImpl({required this.expenseRemoteDataSource});

  @override
  Future<Either<ApiError, List<ExpenseEntity>>> getAllExpenses() async {
    final response = await expenseRemoteDataSource.getAllExpenses();
    return response.fold((error) => Left(error), (expenseModelList) {
      final List<ExpenseEntity> expenseList = expenseModelList
          .map((e) => e.toEntity())
          .toList();
      return Right(expenseList);
    });
  }

  @override
  Future<Either<ApiError, ExpenseEntity>> addExpense({
    required ExpenseModel expenseModel,
  }) async {
    final response = await expenseRemoteDataSource.addExpense(
      expenseModel: expenseModel,
    );
    return response.fold(
      (error) => Left(error),
      (expense) => Right(expense.toEntity()),
    );
  }
}
