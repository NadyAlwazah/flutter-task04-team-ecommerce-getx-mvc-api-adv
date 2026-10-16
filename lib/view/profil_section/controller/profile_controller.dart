// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/image_picker_fun.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/auth_service.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/model/user_fake_data.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final Rxn<File> profileImage = Rxn<File>();
  final UserFakeData userFakeData = UserFakeData();

  late final RxString fullName;
  late final RxString email;
  late final RxString phoneNumber;
  late final RxString dateOfBirth;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final birthDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();

    final user = userFakeData.user;

    fullName = user.fullName.obs;
    email = user.email.obs;
    phoneNumber = user.phoneNumber.obs;
    dateOfBirth = user.dateOfBirth.obs;

    nameController.text = fullName.value;
    emailController.text = email.value;
    phoneController.text = phoneNumber.value;
    birthDateController.text = dateOfBirth.value;
  }

  void updateProfile({
    required String newFullName,
    required String newEmail,
    required String newPhoneNumber,
    required String newDateOfBirth,
  }) {
    fullName.value = newFullName.trim();
    email.value = newEmail.trim();
    phoneNumber.value = newPhoneNumber.trim();
    dateOfBirth.value = newDateOfBirth.trim();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthDateController.dispose();
    super.onClose();
  }

  final Rxn<File> selectedImage = Rxn<File>();

  String get profileImagePath => userFakeData.user.profileImageUrl;

  void updateProfileImage(File image) {
    selectedImage.value = image;
  }

  Future<void> changeProfileImage() async {
    try {
      final XFile? image = await ImagePickerHelper.pickImageFromGallery();

      if (image == null) return;

      profileImage.value = File(image.path);

      print('Image selected: ${image.path}');
    } catch (e) {
      print('Image picker error: $e');
    }
  }
  final AuthService authService = Get.find<AuthService>();

Future<void> logout() async {
  await authService.logout();

  Get.offAllNamed(AppRoutes.kSignin);
}
}
