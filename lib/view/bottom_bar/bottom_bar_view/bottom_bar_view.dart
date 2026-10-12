import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/widgets/custom_bottom_bar.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/home_view.dart';
import 'package:get/get.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({super.key});

  static const List<Widget> _pages = [
    HomeView(),
    Text('Explore'),
    Text('Wishlist'),
    Text('Orders'),
    Text('Favorite'),
    Text('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //! ليظهر المحتوى خلف الشريط العائم
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
