import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/auth/domain/usecases/signup_usecase.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupUseCase}) : super(SignupInitial());
  final SignupUseCase signupUseCase;

  Future<void> signup({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignupLoading());
      final result = await signupUseCase.call(
        UserSignupParameters(name: userName, email: email, password: password),
      );
      result.fold(
        (failure) => emit(SignupFailed(failure: failure)),
        (user) => emit(SignupSuccessful(user: user.userEntity)),
      );
    } catch (e) {
      emit(SignupFailed(failure: ApiError(errorMessage: e.toString())));
    }
  }
}
