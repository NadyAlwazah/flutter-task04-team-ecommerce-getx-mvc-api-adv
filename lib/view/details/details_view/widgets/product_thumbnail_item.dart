import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';

class ProductThumbnailItem extends StatelessWidget {
  final String image;

  const ProductThumbnailItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75.w,
      height: 60.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(child: AppLoader()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error, color: Colors.white)),
        ),
      ),
    );
  }
}
