class PaymentCardModel {
  final String cardHolder;
  final String cardNumber;
  final String expireDate;
  bool isDefault;

  PaymentCardModel({
    required this.cardHolder,
    required this.cardNumber,
    required this.expireDate,
    this.isDefault = false,
  });
}