
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_data/payment_data.dart';
import 'package:get/get.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';

class PaymentCardController extends GetxController {
  // نسخة من بيانات البطاقة الافتراضية للرجوع إليها عند الحاجة
  late final PaymentCardModel defaultCard;

  // قائمة البطاقات المعروضة
  final RxList<PaymentCardModel> paymentCards =
      <PaymentCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // أخذ البطاقة الافتراضية من ملف البيانات
    defaultCard = PaymentCardModel(
      cardHolder: cards.first.cardHolder,
      cardNumber: cards.first.cardNumber,
      expireDate: cards.first.expireDate,
      isDefault: true,
    );

    // بدء الشاشة بالبطاقة الافتراضية
    paymentCards.add(defaultCard);
  }

  // التحقق من صحة بيانات البطاقة
  String? validateCardData({
    required String cardNumber,
    required String cardHolder,
    required String expireDate,
  }) {
    final number = cardNumber.replaceAll(' ', '');

    // يجب أن يتكون رقم البطاقة من 16 رقمًا بالضبط
    if (!RegExp(r'^\d{16}$').hasMatch(number)) {
      return 'Card number must contain exactly 16 digits.';
    }

    // اسم حامل البطاقة مطلوب
    if (cardHolder.trim().isEmpty) {
      return 'Please enter the card holder name.';
    }

    // التاريخ يجب أن يكون بالشكل MM/YY
    final match = RegExp(r'^(\d{2})/(\d{2})$')
        .firstMatch(expireDate.trim());

    if (match == null) {
      return 'Enter the expiry date in MM/YY format.';
    }

    final month = int.parse(match.group(1)!);
    final year = 2000 + int.parse(match.group(2)!);

    // التحقق من الشهر
    if (month < 1 || month > 12) {
      return 'Month must be between 01 and 12.';
    }

    // التحقق من أن البطاقة لم تنتهِ صلاحيتها
    final now = DateTime.now();

    if (year < now.year ||
        (year == now.year && month < now.month)) {
      return 'This card has expired.';
    }

    return null;
  }

  // إضافة بطاقة جديدة
  void addCard(PaymentCardModel card) {
    card.isDefault = false;
    paymentCards.add(card);
  }

  // للتعديل
  void editCard(int index, PaymentCardModel updatedCard) {
    if (index < 0 || index >= paymentCards.length) return;

    updatedCard.isDefault = paymentCards[index].isDefault;
    paymentCards[index] = updatedCard;
  }

  // حذف البطاقة، مع إرجاع الافتراضية إذا أصبحت القائمة فارغة
  void deleteCard(int index) {
    if (index < 0 || index >= paymentCards.length) return;

    paymentCards.removeAt(index);

    if (paymentCards.isEmpty) {
      paymentCards.add(
        PaymentCardModel(
          cardHolder: defaultCard.cardHolder,
          cardNumber: defaultCard.cardNumber,
          expireDate: defaultCard.expireDate,
          isDefault: true,
        ),
      );
    }
  }
}
