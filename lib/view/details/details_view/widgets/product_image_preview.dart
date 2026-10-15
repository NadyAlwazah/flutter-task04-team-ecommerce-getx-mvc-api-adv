import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagePreview extends StatefulWidget {
  const ProductImagePreview({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  final List<String> images;
  final int initialIndex;

  @override
  State<ProductImagePreview> createState() => _ProductImagePreviewState();
}

class _ProductImagePreviewState extends State<ProductImagePreview> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 489.h,
                  margin: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) => CachedNetworkImage(
                      imageUrl: widget.images[index],
                      memCacheWidth: (1.sw * 2).toInt(),
                      fit: BoxFit.cover,
                      placeholder: (_, _) => const Center(child: AppLoader()),
                      errorWidget: (_, _, _) => const Center(
                        child: Icon(Icons.error, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.images.length,
                  effect: CustomizableEffect(
                    spacing: 6.w,
                    dotDecoration: DotDecoration(
                      width: AppSize.s12.w,
                      height: AppSize.s12.h,
                      color: const Color(0xFF262626),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    activeDotDecoration: DotDecoration(
                      width: 20.w,
                      height: AppSize.s14.h,
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          Positioned(
            top: 60.h,
            right: AppSize.s24.w,
            child: IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
