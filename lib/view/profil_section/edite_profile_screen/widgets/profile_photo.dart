import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePhoto extends StatelessWidget {
    ProfilePhoto({
    super.key,
  });
final ProfileController controller =
    Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 108.w,vertical:17.h),
          child: Container(width:118.w,height:136.h,decoration:BoxDecoration(borderRadius: BorderRadius.circular(99),
               gradient:LinearGradient(colors:[AppColors.miniContainerBoarder,AppColors.vipMemberColor,AppColors.miniContainerBoarder],
               begin:Alignment.topRight,end: Alignment.bottomLeft)),
               child:Center(child: 
               Obx(() =>
               CircleAvatar(foregroundImage:controller.profileImage.value != null
        ? FileImage(controller.profileImage.value!):
               NetworkImage(controller.userFakeData.user.profileImageUrl) as ImageProvider,
               radius:80,)),)),
        ),
         Positioned(top:120.h,left:190.w,
         child:InkWell(onTap: controller.changeProfileImage,
           child: Container(width:34.w,height:40.h,
             decoration:BoxDecoration(borderRadius: BorderRadius.circular(99),
                  color: AppColors.primary),
                  child: Center(child:SvgPicture.asset(AssetsData.camera,width: 15,),),),
         ))
      ],
    );
  }
}