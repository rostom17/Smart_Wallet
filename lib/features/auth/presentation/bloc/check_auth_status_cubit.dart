import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:smart_wallet/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';

class CheckAuthStatusCubit extends Cubit<AuthState> {
  CheckAuthStatusCubit({
    required this.checkAuthStatusUsecase,
    required this.getCurrentUserUsecase,
  }) : super(AuthInitial());

  final CheckAuthStatusUsecase checkAuthStatusUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;

  Future<bool> checkStatus() async {
    final isLoggedIn = await checkAuthStatusUsecase.call(NoParams());
    if (isLoggedIn) {
      final user = await getCurrentUserUsecase.call(NoParams());
      if (user is Left) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
