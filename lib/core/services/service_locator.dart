import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_wallet/core/services/auth_service.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton(Dio());
  serviceLocator.registerSingleton(AuthService());
}
