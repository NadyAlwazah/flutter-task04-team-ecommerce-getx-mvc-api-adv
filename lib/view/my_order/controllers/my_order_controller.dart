import 'package:get/get.dart';

class MyOrderController extends GetxController {
  final RxString selectedTab = 'activity'.obs;

  void changeTab(String tab) {
    selectedTab.value = tab;
  }
  void resetTab() {
  selectedTab.value = 'activity';
}
}