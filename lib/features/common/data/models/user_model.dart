import 'package:smart_wallet/core/constants/app_strings.dart';
import 'package:smart_wallet/features/common/domain/entities/user_entity.dart';
import 'package:smart_wallet/features/common/data/models/base_model.dart';

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

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'fullName': fullName,
    'avatarUrl': avatarUrl,
  };

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
