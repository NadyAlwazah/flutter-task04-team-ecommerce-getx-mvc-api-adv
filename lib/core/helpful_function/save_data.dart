
import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
void saveProfile({
  required ProfileController profileController,
  required String fullName,
  required String email,
  required String phoneNumber,
  required String dateOfBirth,
}) {
  profileController.updateProfile(
    newFullName: fullName,
    newEmail: email,
    newPhoneNumber: phoneNumber,
    newDateOfBirth: dateOfBirth,
  );

  Get.back();
}