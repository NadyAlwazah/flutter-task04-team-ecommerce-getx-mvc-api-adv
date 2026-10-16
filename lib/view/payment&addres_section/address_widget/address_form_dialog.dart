
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/address_model.dart';

class AddressFormDialog extends StatefulWidget {
  final AddressModel? address;

  const AddressFormDialog({
    super.key,
    this.address,
  });

  @override
  State<AddressFormDialog> createState() => _AddressFormDialogState();
}

class _AddressFormDialogState extends State<AddressFormDialog> {
  late final TextEditingController titleController;
  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    titleController =
        TextEditingController(text: widget.address?.title ?? '');
    nameController =
        TextEditingController(text: widget.address?.name ?? '');
    addressController =
        TextEditingController(text: widget.address?.address ?? '');
    phoneController =
        TextEditingController(text: widget.address?.phone ?? '');
  }

  @override
  void dispose() {
    titleController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.address != null;

    return AlertDialog(
      backgroundColor: const Color(0xff201F1F),
      title: Text(
        isEditing ? 'Edit Address' : 'Add New Address',
        style: const TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildField(titleController, 'Address Type (Home / Office)'),
            _buildField(nameController, 'Full Name'),
            _buildField(addressController, 'Address'),
            _buildField(phoneController, 'Phone Number'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveAddress,
          child: Text(isEditing ? 'Save Changes' : 'Add Address'),
        ),
      ],
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
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

  void _saveAddress() {
    if (titleController.text.trim().isEmpty ||
        nameController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      Get.snackbar(
        'Missing information',
        'Please fill in all address fields.',
      );
      return;
    }

    final oldAddress = widget.address;
    final title = titleController.text.trim();

    // Keep the existing icon when editing.
    // For a new address, choose an icon according to its type.
    final String addressIcon = oldAddress?.icon ??
        (title.toLowerCase() == 'office'
            ? AssetsData.office
            : AssetsData.home);

    Get.back(
      result: AddressModel(
        title: title,
        name: nameController.text.trim(),
        address: addressController.text.trim(),
        phone: phoneController.text.trim(),
        icon: addressIcon,
        isPrimary: oldAddress?.isPrimary ?? false,
        whiteGloveAvailable:
            oldAddress?.whiteGloveAvailable ?? false,
      ),
    );
  }
}
