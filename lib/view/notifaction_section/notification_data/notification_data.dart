import 'dart:ui';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_model/notification_model.dart';

final notificationData = [
  NotificationModel(
    category: 'ORDERS',
    title: 'Order Shipped #ORD-9821',
    description:
        'Your Linen Trench Coat & Silk Scarf are on the way. Estimated delivery tomorrow.',
    time: '24m ago',
    actionText: 'Track Order',
    isRead: false,
    type: NotificationType.today,
     iconPath: AssetsData.iconTrackerSvg,
     iconActionText:AssetsData.iconLocationSvg, 
     colorContainerActionText:Color(0xff353534),
  ),

  NotificationModel(
    category: 'EXCLUSIVE PROMOTION',
    title: 'Exclusive Weekend Flash Sale',
    description:
        'Enjoy 25% off selected Atelier Autumn Collection with code ATELIER25.',
    time: '3h ago',
    actionText: 'Copy Code',
    isRead: false,
    type: NotificationType.today, 
    iconPath:AssetsData.iconSecondPhotoCardSvg,
     iconActionText:AssetsData.iconCopySvg , 
     colorContainerActionText: AppColors.primary ,
  ),

  NotificationModel(
    category: 'ORDERS',
    title: 'Delivered #ORD-9740',
    description:
        'Your package was safely delivered at your front door.',
    time: 'Yesterday, 4:15 PM',
    isRead: true,
    type: NotificationType.yesterday,
     iconPath: AssetsData.iconThirdPhotoCardSvg,
      iconActionText:AssetsData.iconCopySvg , 
     colorContainerActionText: AppColors.primary ,
  ),

  NotificationModel(
    category: 'WISHLIST UPDATE',
    title: 'Price Drop Alert',
    description:
        'Cashmere Relaxed Knitwear is now \$180 (was \$240).',
    time: 'Yesterday, 10:20 AM',
    isRead: true,
    type: NotificationType.yesterday,
     iconPath: AssetsData.iconFourthPhotoCardSvg,
     iconActionText:AssetsData.iconCopySvg , 
     colorContainerActionText: AppColors.primary ,
  ),

  NotificationModel(
    category: 'SECURITY',
    title: 'Security Update',
    description:
        'New sign-in detected from iOS in New York.',
    time: '4 days ago',
    isRead: true,
    type: NotificationType.earlier, 
    iconPath: AssetsData.iconFifthPhotoCardSvg,
    
    iconActionText:AssetsData.iconCopySvg , 
     colorContainerActionText: AppColors.primary ,
  ),
];