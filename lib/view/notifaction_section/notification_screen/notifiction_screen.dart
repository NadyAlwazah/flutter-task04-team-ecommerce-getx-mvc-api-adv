import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_widget/activity_feed_row.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_widget/divider_of_time.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_widget/notification_read_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_widget/notification_un_read_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_controller/notification_contrtoller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_widget/filter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class NotifictionScreen extends StatelessWidget {
  NotifictionScreen({super.key});
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
    onPressed: () => Get.back(),
    icon: Icon(
      Icons.arrow_back,
      color: AppColors.white,
    ),
  ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xffE5E2E1),
            fontFamily: 'ClashDisplay',
            fontWeight: FontWeight.w400,
            fontSize: AppSize.s24,
          ),
        ),

        actions: [
          Text(
            'Mark all as read',
            style: TextStyle(
              fontFamily: 'Nimbus Sans',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.5, // 18 ÷ 12
              letterSpacing: 0,
              color: AppColors.brown,
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.s16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const ActivityFeedRow(), const Filter()],
            ),

            SizedBox(height: AppSize.s28),

            Expanded(
              child: Obx(
                () => ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: DividerOfTime(day: 'TODAY'),
                    ),

                    ...controller.todayNotifications.map(
                      (notification) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: notification.isRead
                            ? NotificationReadCard(notification: notification)
                            : NotificationUnreadCard(
                                notification: notification,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: DividerOfTime(day: 'YESTERDAY'),
                    ),

                    ...controller.yesterdayNotifications.map(
                      (notification) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: notification.isRead
                            ? NotificationReadCard(notification: notification)
                            : NotificationUnreadCard(
                                notification: notification,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: DividerOfTime(day: 'EARLIER'),
                    ),

                    ...controller.earlierNotifications.map(
                      (notification) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: notification.isRead
                            ? NotificationReadCard(notification: notification)
                            : NotificationUnreadCard(
                                notification: notification,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),SizedBox(height: AppSize.s48,) ,
            Align(alignment: AlignmentGeometry.center,child: Text('ALL NOTIFICATIONS CAUGHT UP',style: 
            Styles.textStyle12W500PlusJakartaSans.copyWith(
            color: AppColors.brown,
          ),),),
          SizedBox(height: AppSize.s36,) ,
          ],
          
        ),
      ),
    );
  }
}
