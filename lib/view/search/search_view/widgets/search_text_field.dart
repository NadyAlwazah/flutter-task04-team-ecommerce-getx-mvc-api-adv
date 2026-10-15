import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_controller/product_search_controller.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.onTapSuffix,
    this.suffixIcon,
    this.readOnly = false,
  });

  final String hintText;
  final VoidCallback? onTap;
  final VoidCallback? onTapSuffix;
  final Widget? suffixIcon;
  final bool readOnly;

  final ProductSearchController controller =
      Get.find<ProductSearchController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        style: Styles.textStyle14W500PlusJakartaSans.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        controller: controller.searchController,
        readOnly: readOnly,
        onChanged: controller.searchProducts,
        keyboardType: TextInputType.text,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.textStyle14W500ClashDisplay.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),

          filled: true,
          fillColor: Colors.white12,

          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 17.h,
              bottom: 17.h,
            ),
            child: SvgPicture.asset(
              AssetsData.iconSearchSvg,
              width: 18.r,
              height: 18.r,
            ),
          ),

          suffixIcon: suffixIcon == null
              ? null
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onTapSuffix,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 14,
                      bottom: 14,
                      right: 16,
                    ),
                    child: suffixIcon,
                  ),
                ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),

          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      ),
    );
  }
}
