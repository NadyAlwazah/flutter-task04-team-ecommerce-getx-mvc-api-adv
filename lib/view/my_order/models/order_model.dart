
enum OrderStatus {
  placed,
  packed,
  shipped,
  delivered,
}

class OrderModel {
  final String id;
  final String orderDate;
  final String totalPrice;
  final String paymentStatus;
  final OrderStatus status;

  // Product information
  final String productName;
  final String productImage;
  final String productDetails;
  final int quantity;

  // Shipment information
  final String shipmentStatus;
  final String shipmentDescription;
  final String carrier;
  final String waybill;
  final String estimatedDelivery;

  // Past order information
  final String? completedDate;
  final String? reviewAction;
  final String? invoiceAction;

  const OrderModel({
    required this.id,
    required this.orderDate,
    required this.totalPrice,
    required this.paymentStatus,
    required this.status,
    required this.productName,
    required this.productImage,
    required this.productDetails,
    required this.quantity,
    required this.shipmentStatus,
    required this.shipmentDescription,
    required this.carrier,
    required this.waybill,
    required this.estimatedDelivery,
    this.completedDate,
    this.reviewAction,
    this.invoiceAction,
  });

  bool get isDelivered => status == OrderStatus.delivered;
}