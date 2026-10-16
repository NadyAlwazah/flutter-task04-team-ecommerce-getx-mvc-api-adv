import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_widget/notification_action_badge.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_controller/notification_contrtoller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_model/notification_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class NotificationUnreadCard extends StatelessWidget {
  const NotificationUnreadCard({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    Get.find<NotificationController>()
        .markAsRead(notification);
  },
      
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff151515),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xff2A2A2A),
          ),
        ),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Container(
        width: 44.w,
        height: 44.h,
        child: SvgPicture.asset(
          notification.iconPath,
        ),
      ),
      
      const SizedBox(width: 12),
      
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  notification.category,
                  style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                    color: AppColors.primary,
                  ),
                ),
      
                const SizedBox(width: 6),
      
                Text(
                  notification.time,
                  style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 4),
      
            Text(
              notification.title,
              style: Styles.textStyle20W500BodoniModa.copyWith(color: AppColors.white,fontSize: 18.sp),
              
            ),
      
            const SizedBox(height: 3),
      
            Text(
              notification.description,
              style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                color: const Color(0xffDCC2B0),
              ),
            ),
      
            const SizedBox(height:AppSize.s10),
      
            NotificationActionBadge(
  text: notification.actionText ?? '',
  iconPath: notification.iconActionText,
  backgroundColor: notification.colorContainerActionText,
)
            
          ],
        ),
      ),
      
      const SizedBox(width: 8),
      
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
      ),
        ],
      ),
        
      ),
    );
  }
}