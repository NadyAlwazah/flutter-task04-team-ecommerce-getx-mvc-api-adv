import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({
    super.key,
    required this.product,
    required this.hasDiscount,
    required this.onRemove,
  });

  final dynamic product;
  final bool hasDiscount;
  final VoidCallback onRemove;

  double getOldPrice(num currentPrice) {
    return currentPrice * 1.2;
  }

  @override
  Widget build(BuildContext context) {
    final currentPrice = product.price;
    final oldPrice = getOldPrice(currentPrice);

    return Container(
      height: hasDiscount ? 180.h : 154.h,
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 92.w,
            height: 120.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                product.images.isNotEmpty &&
                    product.images.first.toString().isNotEmpty
                ? Image.network(
                    product.images.first.toString(),
                    fit: BoxFit.cover,
                  )
                : _imagePlaceholder(),

                if (hasDiscount)
                  Positioned(
                    left: 8.w,
                    bottom: 8.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .75),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "Sale",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.category.name
                              .toString()
                              .toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles
                              .textStyle10W600PlusJakartaSans
                              .copyWith(
                                color: const Color(0xFF92837A),
                                fontSize: 8.sp,
                              ),
                        ),
                      ),

                      GestureDetector(
                        onTap: onRemove,
                        child: Icon(
                          Icons.favorite,
                          color: const Color(0xFFFF982F),
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6.h),
Text(
  product.title
      .toString()
      .split(' ')
      .take(2)
      .join(' '),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: Styles.textStyle18W400BodoniModa.copyWith(
    color: Colors.white,
    fontSize: 14.sp,
  ),
),

                  SizedBox(height: 3.h),

                  Text(
                    product.description.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                      color: const Color(0xFF92837A),
                      fontSize: 9.sp,
                    ),
                  ),SizedBox(height: 2,),
                  Divider(color: Colors.grey.withOpacity(0.1),),
if (hasDiscount) 
 SizedBox(height: 1,)
 else Spacer(),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (hasDiscount)
                            

                          Text(
                            '\$${currentPrice.toStringAsFixed(2)}',
                            style: Styles
                                .textStyle14W600PlusJakartaSans
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),SizedBox(width: 4,),

                          Text(
                              '\$${oldPrice.toStringAsFixed(2)}',
                              style: Styles
                                  .textStyle13W400PlusJakartaSans
                                  .copyWith(
                                    color: const Color(
                                      0xffDCC2B099,
                                    ),
                                    decoration:
                                        TextDecoration.lineThrough,
                                  ),
                            ),
                        ],
                      ),

                      const Spacer(),

                      hasDiscount
                          ?Container(
  constraints: BoxConstraints(
    minWidth: 68.w,
    maxWidth: 80.w,
  ),
  padding: EdgeInsets.symmetric(
    vertical: 6.h,
    horizontal: 5.w,
  ),
  decoration: BoxDecoration(
    color: const Color(0xFFEF674A),
    borderRadius: BorderRadius.circular(30),
  ),
  child: IntrinsicWidth(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 17.sp,
        ),

        SizedBox(width: 3.w),

        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                "ADD",
                overflow: TextOverflow.visible,
                style: Styles
                    .textStyle12W500PlusJakartaSans
                    .copyWith(color: Colors.white,),
              ),

              Text(
                "TO",
                overflow: TextOverflow.visible,
                style: Styles
                    .textStyle12W500PlusJakartaSans
                    .copyWith(color: Colors.white),
              ),

              Text(
                "BAG",
                overflow: TextOverflow.visible,
                style: Styles
                    .textStyle12W500PlusJakartaSans
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
)
                          : Container(height: 28,width: 118,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFEF674A,
                                ),
                                borderRadius:
                                    BorderRadius.circular(
                                      24.r,
                                    ),
                              ),
                              child: Align(alignment: AlignmentGeometry.center,
                                child: Row(
                                  mainAxisSize:
                                      MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons
                                          .shopping_bag_outlined,
                                      color: Colors.white,
                                      size: 12.sp,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "ADD TO BAG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.sp,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: const Color(0xFF202020),
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}