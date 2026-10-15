
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';
import 'package:get/get.dart';
class PaymentCardController extends GetxController {
  // Default payment cards
  final RxList<PaymentCardModel> paymentCards =
      <PaymentCardModel>[
    PaymentCardModel(
      cardHolder: 'SALLY MDHEN',
      cardNumber: '4242424242424242',
      expireDate: '12/28',
      isDefault: true,
    ),
    PaymentCardModel(
      cardHolder: 'SALLY MDHEN',
      cardNumber: '5555555555554444',
      expireDate: '08/29',
      isDefault: false,
    ),
  ].obs;

  // Add a new payment card
  void addCard(PaymentCardModel card) {
    // The first card becomes the default automatically
    if (paymentCards.isEmpty) {
      card.isDefault = true;
    } else {
      card.isDefault = false;
    }

    paymentCards.add(card);
  }

  // Edit an existing payment card
  void editCard(int index, PaymentCardModel updatedCard) {
    if (index < 0 || index >= paymentCards.length) {
      return;
    }

    // Keep the existing default status
    updatedCard.isDefault = paymentCards[index].isDefault;

    paymentCards[index] = updatedCard;
    paymentCards.refresh();
  }

  // Delete a payment card
  void deleteCard(int index) {
    if (index < 0 || index >= paymentCards.length) {
      return;
    }

    final bool wasDefault = paymentCards[index].isDefault;

    paymentCards.removeAt(index);

    // Select another default card if necessary
    if (wasDefault && paymentCards.isNotEmpty) {
      for (final card in paymentCards) {
        card.isDefault = false;
      }

      paymentCards.first.isDefault = true;
    }

    paymentCards.refresh();
  }

  // Set a payment card as default
  void setDefaultCard(int index) {
    if (index < 0 || index >= paymentCards.length) {
      return;
    }

    for (int i = 0; i < paymentCards.length; i++) {
      paymentCards[i].isDefault = i == index;
    }

    paymentCards.refresh();
  }
}
