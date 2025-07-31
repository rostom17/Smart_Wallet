

part of 'auth_cubit.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccessful extends AuthState {
  final UserEntity user;
  AuthSuccessful({required this.user});
}

class AuthFailed extends AuthState {
  final ApiError failure;
  AuthFailed({required this.failure});
}
