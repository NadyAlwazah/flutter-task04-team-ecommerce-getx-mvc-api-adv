import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/add_to_cart_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_info_section.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_options_section.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_price_section.dart';

class DetailsPanelBody extends StatelessWidget {
  const DetailsPanelBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSize.s24.w,
        right: AppSize.s24.w,
        top: 20.h,
        bottom: 31.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductInfoSection(productModel: productModel),

            SizedBox(height: 16.h),
            Divider(color: Colors.grey.shade800, height: 1),

            SizedBox(height: 18.h),
            const ProductOptionsSection(),

            SizedBox(height: 20.h),
            Row(
              children: [
                ProductPriceSection(productModel: productModel),

                const Spacer(),

                AddToCartButton(productModel: productModel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
