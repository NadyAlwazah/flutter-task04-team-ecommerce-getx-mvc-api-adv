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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: SizedBox(height:93.h,width:90.w,
          child: Stack( alignment: Alignment.center,
          clipBehavior: Clip.none,
            children: [
              Container(constraints: BoxConstraints(maxHeight:122.h,),width:double.maxFinite,
              decoration:BoxDecoration(borderRadius: BorderRadius.circular(99),
                   gradient:LinearGradient(colors:[AppColors.miniContainerBoarder,AppColors.vipMemberColor,AppColors.miniContainerBoarder],
                   begin:Alignment.topRight,end: Alignment.bottomLeft)),
                   child:Center(child: 
                   Obx(() =>
                   CircleAvatar(foregroundImage:controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!):
                   NetworkImage(controller.userFakeData.user.profileImageUrl) as ImageProvider,
                   radius:85,)),)),
               Positioned(top:60.h,left:63.w,
               child:InkWell(onTap: controller.changeProfileImage,
                 child: Container(width:34.w,constraints: BoxConstraints(maxHeight:36.h),
                   decoration:BoxDecoration(borderRadius: BorderRadius.circular(99),
                        color: AppColors.primary),
                        child: Center(child:SvgPicture.asset(AssetsData.camera,width: 15,),),),
               ))
            ],
          ),
        ),
      ),
    );
  }
}