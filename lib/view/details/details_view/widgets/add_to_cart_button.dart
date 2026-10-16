import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/add_to_cart.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_options_section.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:get/get.dart';

import '../../details_controller/details_controller.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 184.w,
      child: CustomButton(
        heightButton: 52.h,
        text: "ADD TO CART",
        textStyle: Styles.textStyle16W500ClashDisplay.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        radius: 40.r,
        backgroundColor: Colors.white,
        onPressed: () async {
          final String size = Get.find<DetailsController>().selectedSize.value;
          await addToCart(product: productModel, size: size);
        },
      ),
    );
  }
}
