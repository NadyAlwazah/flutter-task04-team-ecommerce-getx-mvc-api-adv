import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_keys.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/shared_preferences_helper.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final RxList<String> wishlistItems = <String>[].obs;

  late final Future<void> _loadFuture;

  @override
  void onInit() {
    super.onInit();
    _loadFuture = _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    final savedWishlist =
        await SharedPreferencesHelper.getList(AppKeys.kWishlistIds) ??
        <String>[];

    wishlistItems.assignAll(savedWishlist);

    update();
  }

  Future<void> addToWishList({required int productId}) async {
    await _loadFuture;

    final id = productId.toString();

    if (wishlistItems.contains(id)) return;

    wishlistItems.add(id);

    await SharedPreferencesHelper.saveList(
      AppKeys.kWishlistIds,
      wishlistItems.toList(),
    );
  }

  Future<void> removeFromWishList({required int productId}) async {
    await _loadFuture;

    wishlistItems.remove(productId.toString());

    await SharedPreferencesHelper.saveList(
      AppKeys.kWishlistIds,
      wishlistItems.toList(),
    );
  }

  int getCountOfWishlistItems() => wishlistItems.length;
}
