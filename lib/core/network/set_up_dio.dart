import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import './interceptor/logger_interceptor.dart';
import './config/network_config.dart';

Dio getDioInstance() {
  BaseOptions dioOption = BaseOptions(
    baseUrl: NetworkConfig.baseUrl,
    connectTimeout: NetworkConfig.connectionTimeOut,
    headers: {"token": "", "content-type": "application/json"},
  );

  final Dio dio = Dio(dioOption);

  List<Interceptor> interceptors = [
    LoggerInterceptor(),
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: NetworkConfig.retryDelays,
    ),
    //Refresh Interceptor
  ];

  dio.interceptors.addAll(interceptors);

  return dio;
}