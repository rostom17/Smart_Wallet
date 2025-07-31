import 'package:smart_wallet/core/constants/app_strings.dart';
import 'package:smart_wallet/features/auth/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/shared/data/base_model.dart';

class UserModel implements BaseModel<UserEntity> {
  final int? id;
  final String? email;
  final String? fullName;
  final String? avatarUrl;

  UserModel({this.id, this.email, this.fullName, this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      avatarUrl: json['avatarUrl'],
    );
  }

  @override
  UserEntity toEntity() {
    return UserEntity(
      userId: id ?? -1,
      userName: fullName ?? "Unknown",
      userEmail: email ?? "No Email Submitted",
      imageUrl: avatarUrl ?? AppStrings.defaultAvatarUrl,
    );
  }
}
