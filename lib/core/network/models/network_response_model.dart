class NetworkResponseModel {
  final int? statusCode;
  final dynamic bodyData;
  final String message;

  const NetworkResponseModel({
    required this.message,
    this.statusCode,
    this.bodyData,
  });
}