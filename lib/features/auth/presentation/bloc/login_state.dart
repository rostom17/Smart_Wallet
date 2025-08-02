part of 'login_cubit.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessful extends LoginState {
  final UserEntity user;
  LoginSuccessful({required this.user});
}

class LoginFailed extends LoginState {
  final ApiError failure;
  LoginFailed({required this.failure});
}
