
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;
  final String iconNumberPhone ;
  

  

  const AddressCard({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault, required this.iconNumberPhone,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: const Color(0xff201F1F),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color(0xFF302C2A),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              SvgPicture.asset(
               address.icon,
                width: 17,
                height: 15,
              ),
              const SizedBox(width: AppSize.s10),
              Expanded(
                child: Text(
                  address.title,
                  style:Styles.textStyle14W500PlusJakartaSans.copyWith(color: AppColors.white)
                ),
              ),
              if (address.isPrimary)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'DEFAULT',
                    style:Styles. textStyle10W600PlusJakartaSans.copyWith(color: AppColors.backgroundColor)
                  ),
                )
              else
                GestureDetector(
                  onTap: onSetDefault,
                  child: Text(
                    'SET AS DEFAULT',
                    style:Styles. textStyle14W600PlusJakartaSans.copyWith( decoration: TextDecoration.underline,
                    color: AppColors.primary),
                     
                  ),
                ),
            ],
          ),

          const SizedBox(height: AppSize.s16),

          // Address details
          Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: AppColors.secondText,
                  width: 2,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style:Styles.textStyle18W400BodoniModa.copyWith(fontSize: 20.sp, 
                   color:AppColors.whiteLight,) ,
                  
                ),
                const SizedBox(height: 6),
                Text(
                  address.address,
                  style:Styles.textStyle13W400PlusJakartaSans.copyWith(color:AppColors.brownLight,
                  fontSize: 15.sp )
                
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                     SvgPicture.asset(
                iconNumberPhone,
                width: 9,
                height: 9,
              ),
                    const SizedBox(width: 8),
                    Text(
                      address.phone,
                      style:Styles.textStyle11W500PlusJakartaSans.copyWith(color: AppColors.brown,fontSize: 13.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          const Divider(color: Color(0xFF302C2A)),
          const SizedBox(height: 8),

          // Actions
         
Row(
  children: [
    if (address.isPrimary)
      Row(
        children: [
          SvgPicture.asset(
          AssetsData.trackWithOutContainer,
          ),
          SizedBox(width: AppSize.s4),
          Text(
            'WHITE-GLOVE AVAILABLE',
            style: Styles.textStyle11W500PlusJakartaSans.copyWith(
              color: AppColors.brown,
              fontSize: 10.sp,
            ),
          ),
        ],
      )
    else
      const Spacer(),

    const Spacer(),

    GestureDetector(
      onTap: onEdit,
      child: SvgPicture.asset(
        AssetsData.editAddress,
      ),
    ),

    const SizedBox(width: AppSize.s7),

GestureDetector(
      onTap: onEdit,
      child: SvgPicture.asset(width: 32,height: 32,
        AssetsData.buttonDeleteAddress,
      ),
    ),

    /*IconButton(
      onPressed: onDelete,
      icon: const Icon(
        Icons.delete_outline_rounded,
        size: 22,
        color: AppColors.white,
      ),
    ),*/
  ],
)

        ],
      ),
    );
  }
}
