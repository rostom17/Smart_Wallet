import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';

class AuthEntity {
  final String accessToken;
  final int accessTokenExpiry;
  final String refreshToken;
  final int refreshTokenExpiry;
  final UserEntity userEntity;

  AuthEntity({
    required this.accessToken,
    required this.accessTokenExpiry,
    required this.refreshToken,
    required this.refreshTokenExpiry,
    required this.userEntity,
  });

  bool get isAccessTokenExpired =>
      DateTime.now().millisecondsSinceEpoch > accessTokenExpiry;

  bool get isRefreshTokenExpired =>
      DateTime.now().millisecondsSinceEpoch > refreshTokenExpiry;
}
