class ApiConstants {
  static const connectionTimeOut = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);
  static const int maxRetries = 3;
  static const List<Duration> retryDelays = [
    Duration(seconds: 1),
    Duration(seconds: 2),
    Duration(seconds: 4),
  ];
  static const baseUrl = "http://54.90.81.111/api/v1";

  static const loginEndPoint = "/auth/login";
  static const signUpEndPoint = "/auth/sign-up";
  static const userProfileEndPoint = "/users/profile";

  static const expensesEndPoint = "/expenses";
  static const bankCardEndPoint = "/bank-cards";
  static const backCardTypesEndPoint = "/bank-cards/types";
}
