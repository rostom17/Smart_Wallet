import 'package:dartz/dartz.dart';
import 'package:smart_wallet/core/constants/api_constants.dart';
import 'package:smart_wallet/core/network/models/network_request_model.dart';
import 'package:smart_wallet/core/network/models/network_response_model.dart';
import 'package:smart_wallet/core/services/service_locator.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/expense/data/datasource/expense_remote_data_src.dart';
import 'package:smart_wallet/features/expense/data/models/expense_model.dart';

class ExpenseRemoteDataSrcImpl implements ExpenseRemoteDataSource {
  final NetworkExecutor networkExecutor;

  ExpenseRemoteDataSrcImpl({required this.networkExecutor});
  @override
  Future<Either<ApiError, List<ExpenseModel>>> getAllExpenses() async {
    final NetworkResponseModel response = await networkExecutor.getRequest(
      NetworkRequsetModel(path: ApiConstants.expensesEndPoint),
    );

    if (response.statusCode == 200) {
      final List<ExpenseModel> expenseList = [];
      for (Map<String, dynamic> expense in response.bodyData) {
        expenseList.add(ExpenseModel.fromJson(expense));
      }
      return Right(expenseList);
    } else {
      return Left(ApiError(errorMessage: response.message));
    }
  }

  @override
  Future<Either<ApiError, ExpenseModel>> addExpense({
    required ExpenseModel expenseModel,
  }) async {
    final NetworkResponseModel response = await networkExecutor.postRequest(
      NetworkRequsetModel(
        path: ApiConstants.expensesEndPoint,
        body: expenseModel.toJson(),
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(ExpenseModel.fromJson(response.bodyData));
    } else {
      return Left(ApiError(errorMessage: response.message));
    }
  }
}
