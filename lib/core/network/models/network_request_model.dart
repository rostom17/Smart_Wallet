class NetworkRequsetModel {
  final String path;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final Map<String, dynamic>? body;

  NetworkRequsetModel({
    required this.path,
    this.queryParams,
    this.headers,
    this.body,
  });
}
