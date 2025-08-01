class AccessTokenModel {
  final String accessToken;
  final int expiration;

  AccessTokenModel({required this.accessToken, required this.expiration});

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) {
    return AccessTokenModel(
      accessToken: json['token'],
      expiration: json['expiration'],
    );
  }

  bool get isExpired => DateTime.now().millisecondsSinceEpoch > expiration;
}
