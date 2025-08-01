class RefreshTokenModel {
  final String refreshToken;
  final int expiration;

  RefreshTokenModel({required this.refreshToken, required this.expiration});

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      refreshToken: json['token'],
      expiration: json['expiration'],
    );
  }

  

  bool get isExpired => DateTime.now().millisecondsSinceEpoch > expiration;
}
