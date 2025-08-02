import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:smart_wallet/core/constants/app_secrets.dart';
import 'package:smart_wallet/core/network/interceptor/auth_interceptor.dart';
import 'package:smart_wallet/core/services/service_locator.dart';

import './interceptor/logger_interceptor.dart';
import '../constants/api_constants.dart';

Dio getDioInstance() {
  BaseOptions dioOption = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: ApiConstants.connectionTimeOut,
    headers: {"content-type": "application/json"},
  );

  final Dio dio = Dio(dioOption);

  List<Interceptor> interceptors = [
    AuthInterceptor(getToken: getToken, onTokenExpired: onTokenExpired),
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

Future<String?> getToken() async {
  try {
    final accessToken = await GetIt.I<FlutterSecureStorage>().read(
      key: AppSecrets.accessTokenKey,
    );
    return accessToken;
  } catch (e) {
    return null;
  }
}

Future<void> onTokenExpired() async {}
