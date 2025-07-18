import '../models/network_response_model.dart';

abstract class ErrorMapper {
  NetworkResponseModel mapError(Exception e);
}