import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import './interceptor/logger_interceptor.dart';
import '../constants/api_constants.dart';

Dio getDioInstance() {
  BaseOptions dioOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: ApiConstants.connectionTimeOut,
    headers: {"token": "", "content-type": "application/json"},
  );

  final Dio dio = Dio(dioOption);

  List<Interceptor> interceptors = [
    LoggerInterceptor(),
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: ApiConstants.retryDelays,
    ),
    //Refresh Interceptor
  ];

  dio.interceptors.addAll(interceptors);

  return dio;
}
