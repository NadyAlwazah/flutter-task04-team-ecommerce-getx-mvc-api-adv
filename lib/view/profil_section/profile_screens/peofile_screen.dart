import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/my_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/account_concierge.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/account_concierge_header.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/edite_profile_text_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/photo_back_ground_container.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/user_orders_wishlist.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/vip_container.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: AppColors.myOrderBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.myOrderBackGroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Atelier',
              style: Styles.textStyle24W400BodoniModa.copyWith(
                color: AppColors.atelierTextColor,
                letterSpacing: 1.2,
                height: 1.5,
              ),
            ),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.vipMemberColor,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            Text(
              'PROFILE',
              style: Styles.textStyle12W300PlusJakartaSans.copyWith(
                color: AppColors.secondTextColor,
                letterSpacing: 1.2,
                height: 1.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              spacing: 14,
              children: [
                SvgPicture.asset(AssetsData.share),
                SvgPicture.asset(AssetsData.settings),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PhotoAndBackContainer(),
              const SizedBox(height: AppSize.s16),
              Obx(
                () => Text(
                  controller.fullName.value,
                  style: Styles.textStyle28W500BodoniModa.copyWith(
                    color: AppColors.atelierTextColor,
                    height: 1.21,
                    letterSpacing: -0.7,
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s8),
              const VipContainer(),
              const SizedBox(height: AppSize.s14),
              Obx(
                () => Text(
                  controller.email.value,
                  style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                    color: AppColors.secondTextColor,
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s16),
              EditeProfileTextButton(),
              const SizedBox(height: AppSize.s40),
              UserOrdersWishless(),
              const SizedBox(height: AppSize.s40),
              const AccountConciergeHeader(),
              const SizedBox(height: AppSize.s8),
              AccountConcierge(
                title: 'My Orders',
                subtitle: 'Track and view order history',
                icon: AssetsData.list,
                onTap: () {
                  Get.to(() => const MyOrderScreen());
                },
                isLogOut: false,
              ),
              AccountConcierge(
                title: 'Shipping & Payment',
                subtitle: 'Manage cards & delivery addresses',
                icon: AssetsData.card,
                onTap: () {
                  Get.toNamed(AppRoutes.kAddressAndPayment);
                },
                isLogOut: false,
              ),
              AccountConcierge(
                title: 'Account Settings',
                subtitle: 'Personal info, security & password',
                icon: AssetsData.person,
                onTap: () {},
                isLogOut: false,
              ),
              AccountConcierge(
                title: 'Notifications Settings',
                subtitle: 'Push alerts, order updates &\npromotions',
                icon: AssetsData.notification,
                onTap: () {},
                isLogOut: false,
              ),
              AccountConcierge(
                title: 'Help & Support',
                subtitle: 'FAQs, concierge & contact',
                icon: AssetsData.contactUS,
                onTap: () {},
                isLogOut: false,
              ),
              const SizedBox(height: AppSize.s4),
              AccountConcierge(
                title: 'Log Out',
                subtitle: 'Sign out of this session',
                icon: AssetsData.logOut,
                onTap: () {},
                isLogOut: T,
              ),
              const SizedBox(height: AppSize.s40),
              Text(
                'ATELIER HAUTE COUTURE',
                style: Styles.textStyle20W500BodoniModa.copyWith(
                  color: AppColors.atelierTextColor,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: AppSize.s4),
              Text(
                'CLIENT REFERENCE #AT-88294',
                style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                  letterSpacing: 1,
                  color: AppColors.secondTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
