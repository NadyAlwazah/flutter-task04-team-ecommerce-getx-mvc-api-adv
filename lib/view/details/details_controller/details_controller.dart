import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxString selectedSize = 'XL'.obs;

  void changeSize(String size) {
    selectedSize.value = size;
  }
}
