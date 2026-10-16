import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/validators.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/edite_text_fields.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

final profileController = Get.find<ProfileController>();

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child:Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personal Information',
                  style: Styles.textStyle20W500BodoniModa.copyWith(
                    color: AppColors.atelierTextColor,
                    height: 1.5,
                  ),
                ),
                Text(
                  '01 / PRIVATE',
                  style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                    color: AppColors.secondTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
        
            EditeTextFields(validator:(Value)=> Validators.nameValidator(Value),
              hintText: 'Enter Full Name',
              type: TextInputType.name,
              label: 'Full Name',
              badgeText: '',
              isEmail: F,
              suffixIcon: F,
              icon: '',
              controller: controller.nameController,
            ),
            const SizedBox(height: 16),
        
            EditeTextFields(
              validator:Validators.email,
              hintText: 'Enter Your Email',
              type: TextInputType.emailAddress,
              label: 'Email Address',
              badgeText: 'Verified',
              isEmail: T,
              suffixIcon: T,
              icon: AssetsData.chechCircel,
              controller: controller.emailController,
            ),
        
            const SizedBox(height: 16),
        
            EditeTextFields(
              validator:(Value)=> Validators.nameValidator(Value),
              hintText: 'Enter Your Phone Number',
              type: TextInputType.number,
              label: 'Phone Number',
              badgeText: '',
              isEmail: F,
              suffixIcon: F,
              icon: '',
              controller: controller.phoneController,
            ),
            const SizedBox(height: 16),
            EditeTextFields(validator:(Value)=> Validators.nameValidator(Value),
              hintText: 'Enter Date',
              type: TextInputType.datetime,
              label: 'Date of Birth',
              badgeText: '',
              isEmail: F,
              suffixIcon: T,
              icon: AssetsData.calender,
              controller: controller.birthDateController,
            ),
          ],
        ),
      ),
    );
  }
}
