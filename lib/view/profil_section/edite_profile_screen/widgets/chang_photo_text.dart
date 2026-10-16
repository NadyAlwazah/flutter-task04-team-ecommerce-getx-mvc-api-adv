import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:get/get.dart';

class ChangPhotoText extends StatelessWidget {
    ChangPhotoText({
    super.key,
  });
final ProfileController controller =
    Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: controller.changeProfileImage,child: Text('Change Profile Photo',style:Styles.textStyle12W500PlusJakartaSans.copyWith(color:AppColors.primary),));
  }
}