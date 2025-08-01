import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/profile/domain/usecases/logout_usecase.dart';

sealed class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutError extends LogoutState {
  final ApiError errorMessage;
  LogoutError({required this.errorMessage});
}

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUsecase logoutUsecase;

  LogoutCubit({required this.logoutUsecase}) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    final isLoggedOut = await logoutUsecase.call(NoParams());
    isLoggedOut.fold((failure) => LogoutError(errorMessage: failure), (right) {
      if (right == true) {
        emit(LogoutSuccess());
      } else {
        emit(
          LogoutError(errorMessage: ApiError(errorMessage: "Logout Failed ")),
        );
      }
    });
  }
}
