import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_screen/payment_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/address_form_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_controller/address_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_controller/payment_card_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/address_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/add_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/addres_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/payment_form_dialog.dart';

class AddressAndPaymentScreen extends StatelessWidget {
  AddressAndPaymentScreen({super.key});

  final AddressPaymentController controller = Get.put(
    AddressPaymentController(),
  );

  final PaymentCardController paymentCardController = Get.put(
    PaymentCardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.white),
                  ),
                  Column(
                    children: [
                      Text(
                        'Address & Payment',
                        style: Styles.textStyle20W500BodoniModa.copyWith(
                          color: const Color(0xffE5E2E1),
                        ),
                      ),
                      Text(
                        'ATELIER CLIENT PRIVÉ',
                        style: Styles.textStyle11W500PlusJakartaSans.copyWith(
                          color: AppColors.brown,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(AssetsData.truee, width: 15.w, height: 18.h),
                ],
              ),

              SizedBox(height: AppSize.s27),

              // Tabs
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xff1C1B1B),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Row(
                    children: [
                      // Saved Addresses tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedTab.value = 0;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSize.s10,
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedTab.value == 0
                                  ? AppColors.backgroundColor.withOpacity(0.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Text(
                                'Saved Addresses',
                                style: Styles.textStyle12W500PlusJakartaSans
                                    .copyWith(
                                      color: controller.selectedTab.value == 0
                                          ? const Color(0xffDD6040)
                                          : AppColors.brownLight,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Payment Methods tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedTab.value = 1;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSize.s10,
                            ),
                            decoration: BoxDecoration(
                              color: controller.selectedTab.value == 1
                                  ? AppColors.backgroundColor.withOpacity(0.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Text(
                                'Payment Methods',
                                style: Styles.textStyle12W500PlusJakartaSans
                                    .copyWith(
                                      color: controller.selectedTab.value == 1
                                          ? AppColors.primary
                                          : AppColors.brownLight,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.s40),

              // Tab content
              Expanded(
                child: Obx(() {
                  if (controller.selectedTab.value == 0) {
                    return _buildAddressesSection();
                  }

                  return PaymentScreen();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Residences',
                    style: Styles.textStyle20W500BodoniModa.copyWith(
                      color: const Color(0xffE5E2E1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your white-glove shipping destinations',
                    style: Styles.textStyle11W500PlusJakartaSans.copyWith(
                      color: AppColors.brown,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),

            AddNewButton(
              text: 'Add\nNew',
              width: 90,
              iconButtonAddCard: AssetsData.plus,
              onTap: () async {
                final newAddress = await Get.dialog<AddressModel>(
                  const AddressFormDialog(),
                );

                if (newAddress != null) {
                  controller.addAddress(newAddress);
                }
              },
            ),
          ],
        ),

        SizedBox(height: AppSize.s24),

        Expanded(
          child: Obx(
            () => ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: controller.addresses.length,
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final address = controller.addresses[index];

                return AddressCard(
                  address: address,
                  iconNumberPhone: AssetsData.phone,
                  onEdit: () async {
                    final updatedAddress = await Get.dialog<AddressModel>(
                      AddressFormDialog(address: address),
                    );

                    if (updatedAddress != null) {
                      controller.editAddress(index, updatedAddress);
                    }
                  },

                  onDelete: () {
                    Get.dialog(
                      AlertDialog(
                        backgroundColor: const Color(0xff201F1F),
                        title: const Text(
                          'Delete address?',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: const Text(
                          'Are you sure you want to delete this address?',
                          style: TextStyle(color: Colors.white70),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              controller.deleteAddress(index);
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },

                  onSetDefault: () {
                    controller.setPrimary(index);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
