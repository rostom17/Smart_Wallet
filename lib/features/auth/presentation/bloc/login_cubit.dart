import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/usecases/login_usecase.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.lgoinUseCase}) : super(LoginInitial());

  final LoginUseCase lgoinUseCase;

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoading());

      final result = await lgoinUseCase.call(
        UserLoginParameters(email: email, password: password),
      );

      result.fold(
        (failure) => emit(LoginFailed(failure: failure)),
        (user) => emit(LoginSuccessful(user: user.userEntity)),
      );
    } catch (e) {
      emit(LoginFailed(failure: ApiError(errorMessage: e.toString())));
    }
  }
}
