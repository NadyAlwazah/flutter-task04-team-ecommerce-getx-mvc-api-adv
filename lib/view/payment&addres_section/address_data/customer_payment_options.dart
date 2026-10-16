import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_action_model.dart';

final List<PaymentOption> customerPaymentOptions = [
  PaymentOption(
    id: 'apple_pay',
    name: 'Apple Pay',
    detailDescription: 'Linked via Secure Enclave',
    assetIconPath:AssetsData.appleGraphic ,
    tagLabel: 'DEFAULT WALLET',
    actionType: PaymentActionType.switchToggle,
    isEnabled: true,
  ),
  PaymentOption(
    id: 'paypal_express',
    name: 'PayPal Express',
    detailDescription: 'e***a@atelier.com',
    assetIconPath: AssetsData.paybal,
    actionType: PaymentActionType.navigationLink,
    actionLabel: 'Manage',
  ),
];