class CardEntity {
  final String holderName;
  final String cardNo;
  final CardTypeEntity cardType;

  CardEntity({
    required this.holderName,
    required this.cardNo,
    required this.cardType,
  });
}

class CardTypeEntity {
  final int id;
  final String name;
  final String value;

  CardTypeEntity({required this.id, required this.name, required this.value});
}
