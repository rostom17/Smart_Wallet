import 'package:dio/dio.dart';

import 'error_mapper.dart';
import '../models/network_response_model.dart';

class DefaultErrorMapper implements ErrorMapper {
  @override
  NetworkResponseModel mapError(Exception exception) {
    if (exception is DioException) {
      return _mapDioException(exception);
    } else {
      return NetworkResponseModel(message: "Unkonwn Error.!", statusCode: -1);
    }
  }

  NetworkResponseModel _mapDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkResponseModel(message: "Connection Timeout.!");

      case DioExceptionType.connectionError:
        return const NetworkResponseModel(message: "Connection Error");

      case DioExceptionType.badResponse:
        return _mapHttpStatusCode(dioException);

      case DioExceptionType.cancel:
        return const NetworkResponseModel(message: "Canclled");

      case DioExceptionType.unknown:
        return NetworkResponseModel(message: "Unknown Network Error.!");

      default:
        return NetworkResponseModel(message: "An unknown error occured.!");
    }
  }

  NetworkResponseModel _mapHttpStatusCode(DioException dioException) {
    final statusCode = dioException.response?.statusCode;
    final data = dioException.response?.data;

    switch (statusCode) {
      case 400:
        return NetworkResponseModel(
          message: "$statusCode: Bad Request",
          statusCode: statusCode,
        );
      case 401:
        return NetworkResponseModel(
          message: "$statusCode: Unauthorized",
          statusCode: statusCode,
        );
      case 403:
        return NetworkResponseModel(
          message: "$statusCode: Forbidden",
          statusCode: statusCode,
        );
      case 404:
        return NetworkResponseModel(
          message: "$statusCode: Not Found",
          statusCode: statusCode,
        );
      case 422:
        return NetworkResponseModel(
          message: "$statusCode: Unprocessable Content",
          statusCode: statusCode,
        );
      case 429:
        return NetworkResponseModel(
          message: "$statusCode: Too Many request",
          statusCode: statusCode,
        );
      case 500:
        return NetworkResponseModel(
          message: "$statusCode: Internal Server Error",
          statusCode: statusCode,
        );
      case 502:
        return NetworkResponseModel(
          message: "$statusCode: Bad Gatewat",
          statusCode: statusCode,
        );
      case 503:
        return NetworkResponseModel(
          message: "$statusCode: Service Unavailable",
          statusCode: statusCode,
        );
      default:
        if (statusCode != null && statusCode >= 400 && statusCode < 500) {
          return NetworkResponseModel(
            message: 'Client error: $statusCode',
            statusCode: statusCode,
            bodyData: data,
          );
        } else if (statusCode != null && statusCode >= 500) {
          return NetworkResponseModel(
            message: 'Server error: $statusCode',
            statusCode: statusCode,
            bodyData: data,
          );
        } else {
          return NetworkResponseModel(
            message: 'HTTP error: $statusCode',
            statusCode: statusCode,
            bodyData: data,
          );
        }
    }
  }
}