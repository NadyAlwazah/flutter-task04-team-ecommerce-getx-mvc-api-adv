enum PaymentActionType { switchToggle, navigationLink }

class PaymentOption {
  final String id;
  final String name;
  final String detailDescription;
  final String assetIconPath;
  final String? tagLabel; 
  final PaymentActionType actionType;
  bool isEnabled; 
  final String? actionLabel; 

  PaymentOption({
    required this.id,
    required this.name,
    required this.detailDescription,
    required this.assetIconPath,
    this.tagLabel,
    required this.actionType,
    this.isEnabled = false,
    this.actionLabel,
  });
}