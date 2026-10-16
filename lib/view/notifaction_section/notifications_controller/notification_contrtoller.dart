import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_data/notification_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    notifications.assignAll(notificationData);
    super.onInit();
  }

  List<NotificationModel> get todayNotifications {
    return notifications
        .where(
          (notification) =>
              notification.type == NotificationType.today,
        )
        .toList();
  }

  List<NotificationModel> get yesterdayNotifications {
    return notifications
        .where(
          (notification) =>
              notification.type == NotificationType.yesterday,
        )
        .toList();
  }

  List<NotificationModel> get earlierNotifications {
    return notifications
        .where(
          (notification) =>
              notification.type == NotificationType.earlier,
        )
        .toList();
  }

  void markAsRead(NotificationModel notification) {
    notification.isRead = true;
    notification.type = NotificationType.yesterday;

    notifications.refresh();
  }
//count number of un read member
  int get unreadCount {
  return notifications.where(
    (notification) => !notification.isRead,
  ).length;
}



}