import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/security_options.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SecurityAndAccessWidget extends StatelessWidget {
  const SecurityAndAccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color:AppColors.backgroundItem ,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:   [
              Text(
                'Security & Access',
                style:Styles.textStyle20W500BodoniModa.copyWith(color: AppColors.atelierTextColor,height: 1.5)
              ),
              Text(
                '03 / KEY',
                style:Styles.textStyle10W600PlusJakartaSans.copyWith(color:AppColors.secondTextColor)
              ),
            ],
          ),
          const SizedBox(height: 20),
           SecurityOptions(
            icon:AssetsData.circlLock,
            title: 'Change Password',
            subtitle: 'Updated 4 months ago',
            onTap: () {
            
            }, showIndicator: F,
          ),
          const SizedBox(height: 12),

       
          SecurityOptions(
            icon:AssetsData.security,
            title: 'Two-Factor Authentication',
            subtitle: 'Enabled via Authenticator App',
            showIndicator: true,
            onTap: () {
             
            },
          ),
        ],
      ),
    );
  }
}
  
