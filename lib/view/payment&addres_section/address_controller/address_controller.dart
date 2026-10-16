import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_data/addres_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/address_model.dart';

class AddressPaymentController extends GetxController {
  // Selected tab: 0 = Saved Addresses, 1 = Payment Methods
  final selectedTab = 0.obs;

  // Reactive addresses list
  final RxList<AddressModel> addresses = <AddressModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Load initial addresses
    addresses.assignAll(addressesData);
  }

  // Set an address as default
  void setPrimary(int index) {
    if (index < 0 || index >= addresses.length) return;

    for (int i = 0; i < addresses.length; i++) {
      addresses[i] = addresses[i].copyWith(
        isPrimary: i == index,
      );
    }
  }

  // Add a new address
  void addAddress(AddressModel address) {
    final shouldBePrimary =
        addresses.isEmpty || address.isPrimary;

    if (shouldBePrimary) {
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = addresses[i].copyWith(
          isPrimary: false,
        );
      }
    }

    addresses.add(
      address.copyWith(
        isPrimary: shouldBePrimary,
      ),
    );
  }

  // Edit an existing address
  void editAddress(int index, AddressModel updatedAddress) {
    if (index < 0 || index >= addresses.length) return;

    final currentAddress = addresses[index];

    addresses[index] = updatedAddress.copyWith(
      isPrimary: currentAddress.isPrimary,
      whiteGloveAvailable: currentAddress.whiteGloveAvailable,
    );
  }

  // Delete an address
  void deleteAddress(int index) {
    if (index < 0 || index >= addresses.length) return;

    final wasPrimary = addresses[index].isPrimary;

    addresses.removeAt(index);

    // If the default address was deleted,
    // set the first remaining address as default
    if (wasPrimary && addresses.isNotEmpty) {
      setPrimary(0);
    }
  }
}
