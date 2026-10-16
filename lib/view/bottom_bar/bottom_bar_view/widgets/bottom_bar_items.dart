
import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_model/nav_item.dart';

class BottomBarItems {
  static const List<NavItem> items = [
    NavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    NavItem(
      icon: Icons.favorite_border,
      activeIcon: Icons.favorite,
      label: 'Favorite',
    ),
  ];
}









/*import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_model/nav_item.dart';

class BottomBarItems {
  static const List<NavItem> items = [
    NavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    NavItem(icon: Icons.search, activeIcon: Icons.search, label: 'Explore'),
    NavItem(
      icon: Icons.bookmark_border,
      activeIcon: Icons.bookmark,
      label: 'Wishlist',
    ),
    NavItem(
      icon: Icons.receipt_long_outlined,
      activeIcon: Icons.receipt_long,
      label: 'Orders',
    ),
    NavItem(
      icon: Icons.favorite_border,
      activeIcon: Icons.favorite,
      label: 'Favorite',
    ),
    NavItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
    ),
  ];
}*/
