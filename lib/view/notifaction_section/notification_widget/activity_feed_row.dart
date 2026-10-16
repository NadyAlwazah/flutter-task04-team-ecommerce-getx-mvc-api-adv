
import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_controller/notification_contrtoller.dart';
import 'package:get/get.dart';

class ActivityFeedRow extends StatelessWidget {
  const ActivityFeedRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotificationController>();

    return Row(
      children: [
        Text(
          'ACTIVITY FEED',
          style: TextStyle(
            color: const Color(0xFFE5E2E1),
            fontSize: AppSize.s11,
            fontWeight: FontWeight.w700,
            fontFamily: 'NimbusSans',
          ),
        ),

        const SizedBox(width: 8),

        Container(height: 21
        ,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  controller.unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),

              const SizedBox(width: 4),

              const Text(
                'New',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
