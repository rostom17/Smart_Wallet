part of 'profile_data_cubit.dart';
sealed class ProfileDataState {}

class ProfileDataInitial extends ProfileDataState {}

class ProfileDataLoading extends ProfileDataState {}

class ProfileDataLoadedSuccess extends ProfileDataState {
  final UserEntity user;

  ProfileDataLoadedSuccess({required this.user});
}

class ProfileDataLoadFailed extends ProfileDataState {
  final ApiError error;

  ProfileDataLoadFailed({required this.error});
}
