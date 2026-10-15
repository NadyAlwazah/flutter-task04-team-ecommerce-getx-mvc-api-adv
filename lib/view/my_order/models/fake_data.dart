import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/order_model.dart';

class OrdersFakeData {
  static final List<OrderModel> activeOrders = [
    const OrderModel(
      id: 'ORD-2024-8842',
      orderDate: 'Oct 24,2024',
      totalPrice: '165.00',
      paymentStatus: 'PREPAID',
      status: OrderStatus.shipped,

      productName: 'Cashmere Overcoat & Beanie',
      productImage: 'https://s.yimg.com/fz/api/res/1.2/WXjv7clCLhv3AAXfB3yqVg--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpbGw7aD00MTI7cHhvZmY9NTA7cHlvZmY9MTAwO3E9ODA7c3M9MTt3PTM4OA--/https://i.pinimg.com/736x/c4/90/17/c490179b6c0cc7bd38763d2b0d5d3d3a.jpg',
      productDetails: 'Size 42 / Charcoal • One Size / Onyx',
      quantity: 2,

      shipmentStatus: 'In Transit - Out for Delivery',
      shipmentDescription: 'Arrived at sorting facility, New York NY',
      carrier: 'DHL Express',
      waybill: 'DHB942104920US',
      estimatedDelivery: 'by Oct 28',
    ),
  ];

  static final List<OrderModel> pastOrders = [
    const OrderModel(
      id: 'ORD-2024-7619',
      orderDate: 'Oct 24,2024',
      totalPrice: '210.00',
      paymentStatus: 'PAID',
      status: OrderStatus.delivered,

      productName: 'Silk Shirt & Linen Scarf',
      productImage: 'https://s.yimg.com/fz/api/res/1.2/WXjv7clCLhv3AAXfB3yqVg--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpbGw7aD00MTI7cHhvZmY9NTA7cHlvZmY9MTAwO3E9ODA7c3M9MTt3PTM4OA--/https://i.pinimg.com/736x/c4/90/17/c490179b6c0cc7bd38763d2b0d5d3d3a.jpg',
      productDetails: 'Regular Fit',
      quantity: 2,

      shipmentStatus: 'Delivered',
      shipmentDescription: 'Package delivered successfully',
      carrier: 'DHL Express',
      waybill: 'DHL761900123US',
      estimatedDelivery: 'by Sep 15',

      completedDate: 'Sep 15,2024',
      reviewAction: 'Leave Review',
      invoiceAction: 'Download Invoice',
    ),

    const OrderModel(
      id: 'ORD-2024-6502',
      orderDate: 'Oct 24,2024',
      totalPrice: '185.00',
      paymentStatus: 'PAID',
      status: OrderStatus.delivered,

      productName: 'Minimal Leather Loafers',
      productImage: 'https://s.yimg.com/fz/api/res/1.2/WXjv7clCLhv3AAXfB3yqVg--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpbGw7aD00MTI7cHhvZmY9NTA7cHlvZmY9MTAwO3E9ODA7c3M9MTt3PTM4OA--/https://i.pinimg.com/736x/c4/90/17/c490179b6c0cc7bd38763d2b0d5d3d3a.jpg',
      productDetails: 'EU 43 / Black',
      quantity: 1,

      shipmentStatus: 'Delivered',
      shipmentDescription: 'Package delivered successfully',
      carrier: 'DHL Express',
      waybill: 'DHL650200456US',
      estimatedDelivery: 'by Aug 2',

      completedDate: 'Sep 15,2024',
      invoiceAction: 'Download Invoice',
    ),
  ];
}
