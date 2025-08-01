import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/usecases/login_usecase.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

part 'auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit({required this.lgoinUseCase}) : super(AuthInitial());

  final LoginUseCase lgoinUseCase;

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      final result = await lgoinUseCase.call(
        UserLoginParameters(email: email, password: password),
      );

      result.fold(
        (failure) => emit(AuthFailed(failure: failure)),
        (user) => emit(AuthSuccessful(user: user.userEntity)),
      );
    } catch (e) {
      emit(AuthFailed(failure: ApiError(errorMessage: e.toString())));
    }
  }
}
