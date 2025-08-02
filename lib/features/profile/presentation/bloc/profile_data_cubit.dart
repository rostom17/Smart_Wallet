import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/domain/entities/api_error.dart';
import 'package:smart_wallet/features/common/domain/entities/no_params.dart';
import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/profile/domain/usecases/get_current_user_usecase.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;

  ProfileDataCubit({required this.getCurrentUserUsecase})
    : super(ProfileDataInitial());

  Future<void> getProfileData() async {
    emit(ProfileDataLoading());
    try {
      final response = await getCurrentUserUsecase.call(NoParams());
      response.fold(
        (error) => emit(ProfileDataLoadFailed(error: error)),
        (user) => emit(ProfileDataLoadedSuccess(user: user)),
      );
    } catch (e) {
      emit(ProfileDataLoadFailed(error: ApiError(errorMessage: e.toString())));
    }
  }
}
