import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/save_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/chang_photo_text.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/edite_data_container.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/is_vip_person.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/profile_photo.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/security_access_widget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/sizing_selhouette_wiget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class EditeProfileScreen extends StatelessWidget {
  const EditeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
final controller = Get.find<ProfileController>();
    return Scaffold(backgroundColor: AppColors.myOrderBackGroundColor,
      appBar: AppBar(backgroundColor: AppColors.myOrderBackGroundColor,
        leading:InkWell(onTap:(){Get.back();},child: Icon(Icons.arrow_back,color: Colors.white,)),
      title:Text('Edit Profile',style:Styles.textStyle20W500BodoniModa.copyWith(color:AppColors.atelierTextColor,
      height: 1.5),),
      centerTitle: T,
      actions: [Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
      onTap: () {
  saveProfile(
    profileController: Get.find<ProfileController>(),
    fullName: controller.nameController.text,
    email: controller.emailController.text,
    phoneNumber: controller.phoneController.text,
    dateOfBirth: controller.birthDateController.text,
  );
},

child: Text('Done',style: Styles.textStyle14W600PlusJakartaSans.copyWith(color: AppColors.primary),)),
      )],),
      body:SingleChildScrollView(
        child:Padding(padding:const EdgeInsets.symmetric(horizontal:AppSize.s20),
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
                ProfilePhoto(),
                 const SizedBox(height:AppSize.s16,),
               const IsVipAtelier(),
               const SizedBox(height:AppSize.s10,),
                 ChangPhotoText(),
               const SizedBox(height:AppSize.s40,),
               const PersonalInfoScreen(),
               const SizedBox(height:AppSize.s32,),
               const SizingScreen(),
               const SizedBox(height:AppSize.s32,),
               const SecurityAndAccessWidget(),
               const SizedBox(height:AppSize.s40,),
               CustomButton( onPressed: () {
  saveProfile(
    profileController: Get.find<ProfileController>(),
    fullName: controller.nameController.text,
    email: controller.emailController.text,
    phoneNumber: controller.phoneController.text,
    dateOfBirth: controller.birthDateController.text,
  );
},
text:'SAVE CHANGES',radius: 99,
               textStyle:Styles.textStyle14W600PlusJakartaSans.copyWith(height: 1.4,color:Colors.white),
               backgroundColor:AppColors.primary,heightButton:50,withSide:F),
               const SizedBox(height:AppSize.s12,),
               CustomButton(onPressed: Get.back,backgroundColor:AppColors.myOrderBackGroundColor,
                text:'Cancel',textStyle:Styles.textStyle14W600PlusJakartaSans.copyWith(height: 1.4,color:Colors.white),heightButton: 48,)
             , const SizedBox(height: AppSize.s40,) ]
        ),),

      ),
    );
  }
}




