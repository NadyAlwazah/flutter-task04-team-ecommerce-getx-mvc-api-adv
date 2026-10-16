import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/explore/explore_view/explore_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/widgets/custom_bottom_bar.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_view/favorite_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/home_view.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/wishlist/wishlist_screen/wishlist_screen.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/my_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/peofile_screen.dart';

import 'package:get/get.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({super.key});
  static const List<Widget> _pages = [
    HomeView(),
    ExploreView(),
    WishlistScreen(),
    MyOrderScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: _pages,
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
