import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/category_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70.w,
        height: 106.h,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 1,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: category.image,
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(radius: 35.r, backgroundImage: imageProvider),
                placeholder: (context, url) =>
                    CircleAvatar(radius: 35.r, child: const AppLoader()),
                errorWidget: (context, url, error) =>
                    CircleAvatar(radius: 35.r, child: const Icon(Icons.error)),
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            Text(
              category.name.toUpperCase(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle16W500ClashDisplay.copyWith(
                color: isSelected ? AppColors.primary : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
