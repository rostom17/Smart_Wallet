import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String message =
        '''
      uri: ${options.uri},
      baseUrl: ${options.baseUrl},
      path: ${options.path}
      headers: ${options.headers},
      data: ${options.data},
      connection type: ${options.contentType},
      validation status : ${options.validateStatus},
      query params: ${options.queryParameters}
      ''';

    _logger.d(message);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String message =
        '''
      status code: ${response.statusCode},
      headers: ${response.headers},
      real uri: ${response.realUri},
      status message: ${response.statusMessage},
      response data: ${response.data},
      request options: ${response.requestOptions}
    ''';

    _logger.d(message);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message =
        ''' 
      error name: ${err.error},
      error message: ${err.message},
      error type: ${err.type}
      respoense : ${err.response},
      stack tace : ${err.stackTrace},
      req options : ${err.requestOptions}
    ''';

    _logger.e(message);

    super.onError(err, handler);
  }
}