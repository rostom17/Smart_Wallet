import 'package:smart_wallet/features/common/data/models/base_model.dart';
import 'package:smart_wallet/features/wallet/data/models/card_type_model.dart';
import 'package:smart_wallet/features/wallet/domain/entities/card_entity.dart';

class CardModel implements BaseModel<CardEntity> {
  final String? holderName;
  final String? cardNo;
  final CardTypeModel cardType;

  CardModel({
    required this.holderName,
    required this.cardNo,
    required this.cardType,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      holderName: json['holderName'],
      cardNo: json['cardNo'],
      cardType: CardTypeModel.fromJson(json['cardType']),
    );
  }

  @override
  CardEntity toEntity() {
    return CardEntity(
      holderName: holderName ?? "Unknown",
      cardNo: cardNo ?? "Unknown",
      cardType: cardType.toEntity(),
    );
  }
}
