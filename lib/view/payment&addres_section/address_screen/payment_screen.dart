
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/security_notice_card.dart';
import 'package:get/get.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_controller/payment_card_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_data/customer_payment_options.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/add_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/payment_form_dialog.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/payment_card_del_edit.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/payment_main_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_widget/payment_option_tile.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentCardController paymentCardController =
      Get.find<PaymentCardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Payment title and Add New Card button
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Instruments',
                    style: Styles.textStyle20W500BodoniModa.copyWith(
                      color: const Color(0xffE5E2E1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Curated vault & vaulted digital assets',
                    style: Styles.textStyle11W500PlusJakartaSans.copyWith(
                      color: AppColors.brown,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            AddNewButton(
              text: 'Add New\nCard',
              iconButtonAddCard: AssetsData.iconAddNewCard,
              width: 122,
              onTap: () async {
                final newCard = await Get.dialog<PaymentCardModel>(
                  const PaymentCardFormDialog(),
                );

                if (newCard != null) {
                  paymentCardController.addCard(newCard);
                }
              },
            ),
          ],
        ),

        SizedBox(height: AppSize.s24),

        // One scrollable list for cards and digital wallets
        Expanded(
          child: Obx(() {
            final cards = paymentCardController.paymentCards;

            return ListView(
              padding: EdgeInsets.only(bottom: 16.h),
              children: [
                // Payment cards
                if (cards.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Center(
                      child: Text(
                        'No payment methods added yet.',
                        style:
                            Styles.textStyle12W500PlusJakartaSans.copyWith(
                          color: AppColors.brownLight,
                        ),
                      ),
                    ),
                  )
                else
                  ...cards.asMap().entries.map((entry) {
                    final index = entry.key;
                    final card = entry.value;

                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Column(
                        children: [
                          PaymentMainCard(
                            card: card,
                            isDefault: card.isDefault,
                          ),

                          SizedBox(height: 10.h),

                          PaymentCardControls(
                            card: card,
                            onEdit: () async {
                              final updatedCard =
                                  await Get.dialog<PaymentCardModel>(
                                PaymentCardFormDialog(card: card),
                              );

                              if (updatedCard != null) {
                                paymentCardController.editCard(
                                  index,
                                  updatedCard,
                                );
                              }
                            },
                            onDelete: () {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text('Delete Card'),
                                  content: const Text(
                                    'Are you sure you want to delete this card?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                        paymentCardController
                                            .deleteCard(index);
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }),

                // Digital wallets section
                SizedBox(height: AppSize.s12),

                Text(
                  'DIGITAL WALLETS & INSTANT PAY',
                  style: Styles.textStyle11W500PlusJakartaSans.copyWith(
                    color: AppColors.brown,
                    fontSize: 13.sp,
                  ),
                ),

                SizedBox(height: AppSize.s12),

                // Customer payment options
                ...customerPaymentOptions.map((option) {
                  return Column(
                    children: [
                      PaymentOptionTile(
                        paymentOption: option,
                        onToggleChanged: (newValue) {
                          // Handle the switch state here.
                        },
                        onActionPressed: () {
                          // Handle the Manage action here.
                        },
                      ),
                      SizedBox(height: 12,),
                     
                    ],
                  );
                }), SizedBox(height: 40,),

                 SecurityNoticeCard(),
        SizedBox(height: AppSize.s48,)
              ],
            );
          }),
        ),
       
      ],
    );
  }
}
