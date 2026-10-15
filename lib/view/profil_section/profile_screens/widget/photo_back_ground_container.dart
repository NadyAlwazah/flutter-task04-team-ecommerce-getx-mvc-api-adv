import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class PhotoAndBackContainer extends StatelessWidget {
    PhotoAndBackContainer({
    super.key,
  });
final ProfileController controller =
    Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [Padding(
      padding:  EdgeInsets.symmetric(horizontal:140.w,vertical:22.h),
      
      child: Container(width: 100.w,height: 100.h,decoration:BoxDecoration(shape: BoxShape.circle,
        color:AppColors.vipMemberColor,
      boxShadow: [
            BoxShadow(
             color:AppColors.vipMemberColor.withOpacity(0.1),
        spreadRadius:64,  
        blurRadius:40,   
        offset: Offset.zero,  
            ),
          ],  ),)),
          
          Positioned(top:5.h,left:115.w,
            child: Container(width:112.w,height:132.h,decoration:BoxDecoration(borderRadius: BorderRadius.circular(99),
            gradient:LinearGradient(colors:[AppColors.imageGridentColor,AppColors.backgroundNumberColor,AppColors.vipMemberColor],
            begin:Alignment.topRight,end: Alignment.bottomLeft)),
            child:Center(child: Obx(() =>
        CircleAvatar(foregroundImage:controller.profileImage.value != null
        ? FileImage(controller.profileImage.value!):
               NetworkImage(controller.userFakeData.user.profileImageUrl) as ImageProvider,radius:56,)),)),
          ),
          Positioned(top:95.h,left:185.w,
            child:InkWell(onTap: controller.changeProfileImage,
              child: Container(width:38.w,height:44.h,
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(99),
                        color: AppColors.vipMemberColor),
                        child: Center(child:SvgPicture.asset(AssetsData.edite,width: 15,),),),
            ))
          ],);
  }
}