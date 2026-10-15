import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.productModel});

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
        onPressed: () {},
      ),
    );
  }
}
