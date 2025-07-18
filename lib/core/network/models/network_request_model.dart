import 'package:dio/dio.dart';

class NetworkRequsetModel {
  final String path;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final FormData? formData;

  NetworkRequsetModel({
    required this.path,
    this.queryParams,
    this.headers,
    this.formData,
  });
}