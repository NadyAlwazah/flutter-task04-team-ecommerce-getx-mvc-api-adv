import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_thumbnail_item.dart';

class DetailsThumbnailsList extends StatelessWidget {
  const DetailsThumbnailsList({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 415.h,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          height: 75.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: productModel.images.length,
            separatorBuilder: (_, _) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return ProductThumbnailItem(image: productModel.images[index]);
            },
          ),
        ),
      ),
    );
  }
}
