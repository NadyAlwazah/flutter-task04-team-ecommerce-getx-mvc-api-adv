import 'package:get/get.dart';

class BottomBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }
}
