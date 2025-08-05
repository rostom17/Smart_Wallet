class NewCardRequestModel {
  final String holderName;
  final String cardNo;
  final String cvc;
  final String expiryDate;
  final int cardTypeId;

  NewCardRequestModel({
    required this.holderName,
    required this.cardNo,
    required this.cvc,
    required this.expiryDate,
    required this.cardTypeId,
  });

  Map<String, dynamic> toJson() {
    return {
      "holderName": holderName,
      "cardNo": cardNo,
      "cvc": cvc,
      "expiryDate": expiryDate,
      "cardTypeId": 1,
    };
  }
}
