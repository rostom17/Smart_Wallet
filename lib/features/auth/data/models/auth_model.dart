import 'package:smart_wallet/features/auth/data/models/access_token_model.dart';
import 'package:smart_wallet/features/auth/data/models/refresh_token_model.dart';
import 'package:smart_wallet/features/common/data/models/user_model.dart';
import 'package:smart_wallet/features/auth/domain/entities/auth_entity.dart';
import 'package:smart_wallet/features/common/data/models/base_model.dart';

class AuthModel implements BaseModel<AuthEntity> {
  final AccessTokenModel accessTokenModel;
  final RefreshTokenModel refreshTokenModel;
  final UserModel userModel;

  AuthModel({
    required this.accessTokenModel,
    required this.refreshTokenModel,
    required this.userModel,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      // TODO: There is and error

      accessTokenModel: AccessTokenModel.fromJson(json['accessToken']),
      refreshTokenModel: RefreshTokenModel.fromJson(json['refreshToken']),
      userModel: UserModel.fromJson(json['user'])
    );
  }

  @override
  AuthEntity toEntity() {
    return AuthEntity(
      accessToken: accessTokenModel.accessToken,
      accessTokenExpiry: accessTokenModel.expiration,
      refreshToken: refreshTokenModel.refreshToken,
      refreshTokenExpiry: refreshTokenModel.expiration,
      userEntity: userModel.toEntity(),
    );
  }
}
