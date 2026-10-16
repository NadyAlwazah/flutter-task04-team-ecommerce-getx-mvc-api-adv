import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notifications_controller/notification_contrtoller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NotificationController(),
    );
  }
}