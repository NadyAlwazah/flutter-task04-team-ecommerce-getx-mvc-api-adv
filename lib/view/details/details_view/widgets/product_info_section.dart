import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:readmore/readmore.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.category.name,
          style: Styles.textStyle16W500ClashDisplay.copyWith(
            color: AppColors.secondText,
          ),
        ),

        SizedBox(height: AppSize.s8.h),

        Text(
          productModel.title,
          style: Styles.textStyle30W500ClashDisplay.copyWith(
            color: Colors.white,
          ),
        ),

        SizedBox(height: AppSize.s12.h),

        ReadMoreText(
          productModel.description,
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read More',
          trimExpandedText: ' less',
          moreStyle: Styles.textStyle14W500ClashDisplay.copyWith(
            decoration: TextDecoration.underline,
            color: Colors.white,
            decorationColor: Colors.white,
          ),
          lessStyle: Styles.textStyle14W500ClashDisplay.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            color: Colors.white,
          ),
          style: Styles.textStyle14W500ClashDisplay.copyWith(
            color: AppColors.secondText,
          ),
        ),
      ],
    );
  }
}
