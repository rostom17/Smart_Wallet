part of 'signup_cubit.dart';

sealed class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccessful extends SignupState {
  final UserEntity user;
  SignupSuccessful({required this.user});
}

class SignupFailed extends SignupState {
  final ApiError failure;
  SignupFailed({required this.failure});
}
