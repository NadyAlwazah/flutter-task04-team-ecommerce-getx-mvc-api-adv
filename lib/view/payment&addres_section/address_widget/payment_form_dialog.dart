
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_controller/payment_card_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';

class PaymentCardFormDialog extends StatefulWidget {
  final PaymentCardModel? card;

  const PaymentCardFormDialog({
    super.key,
    this.card,
  });

  @override
  State<PaymentCardFormDialog> createState() =>
      _PaymentCardFormDialogState();
}

class _PaymentCardFormDialogState
    extends State<PaymentCardFormDialog> {
  late final TextEditingController cardNumberController;
  late final TextEditingController cardHolderController;
  late final TextEditingController expireDateController;

  late final PaymentCardController paymentController;

  @override
  void initState() {
    super.initState();

    paymentController = Get.find<PaymentCardController>();

    cardNumberController = TextEditingController(
      text: widget.card?.cardNumber.replaceAll(' ', '') ?? '',
    );

    cardHolderController = TextEditingController(
      text: widget.card?.cardHolder ?? '',
    );

    expireDateController = TextEditingController(
      text: widget.card?.expireDate ?? '',
    );
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expireDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.card != null;

    return AlertDialog(
      backgroundColor: const Color(0xff201F1F),
      title: Text(
        isEditing ? 'Edit Card' : 'Add New Card',
        style: const TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildField(
              cardNumberController,
              'Card Number',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
            ),
            _buildField(
              cardHolderController,
              'Card Holder Name',
              keyboardType: TextInputType.name,
            ),
            _buildField(
              expireDateController,
              'Expire Date (MM/YY)',
              keyboardType: TextInputType.number,
              inputFormatters: [
                ExpiryDateInputFormatter(),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveCard,
          child: Text(isEditing ? 'Save Changes' : 'Add Card'),
        ),
      ],
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff302C2A)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDD6040)),
          ),
        ),
      ),
    );
  }

  void _saveCard() {
    final errorMessage = paymentController.validateCardData(
      cardNumber: cardNumberController.text,
      cardHolder: cardHolderController.text,
      expireDate: expireDateController.text,
    );

    if (errorMessage != null) {
      Get.snackbar(
        'Invalid card information',
        errorMessage,
        backgroundColor: const Color(0xff302C2A),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.back(
      result: PaymentCardModel(
        cardNumber: cardNumberController.text.trim(),
        cardHolder: cardHolderController.text.trim(),
        expireDate: expireDateController.text.trim(),
        isDefault: widget.card?.isDefault ?? false,
      ),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 4) {
      return oldValue;
    }

    final formatted = digits.length > 2
        ? '${digits.substring(0, 2)}/${digits.substring(2)}'
        : digits;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: formatted.length,
      ),
    );
  }
}
