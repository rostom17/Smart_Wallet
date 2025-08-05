import 'package:smart_wallet/features/common/data/models/base_model.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';

class CardTypeModel implements BaseModel<CardTypeEntity> {
  final int? id;
  final String? name;
  final String? value;

  CardTypeModel({required this.id, required this.name, required this.value});

  factory CardTypeModel.fromJson(Map<String, dynamic> json) {
    return CardTypeModel(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  @override
  CardTypeEntity toEntity() {
    return CardTypeEntity(
      id: id ?? 0,
      name: name ?? "unknown",
      value: value ?? "Unknown",
    );
  }
}
