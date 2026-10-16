import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_controller/favorite_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_widget/favorite_card.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedFilter = 0;

  static const Color background = Color(0xFF141414);
  static const Color textColor = Color(0xFFE5E2E1);
  static const Color mutedColor = Color(0xFF92837A);
  static const Color orangeColor = Color(0xFFEF674A);

  final List<String> filters = [
    'All Items',
    'Outerwear',
    'Tops',
    'Footwear',
  ];

  bool _matchesFilter(dynamic product, int filter) {
    if (filter == 0) return true;

    final title = product.title.toString().toLowerCase();
    final slug = product.slug.toString().toLowerCase();
    final category = product.category.name.toString().toLowerCase();

    final text = '$title $slug $category';

    switch (filter) {
      case 1:
        return text.contains('coat') ||
            text.contains('jacket') ||
            text.contains('outerwear');

      case 2:
        return text.contains('shirt') ||
            text.contains('top') ||
            text.contains('sweater') ||
            text.contains('knit') ||
            text.contains('hoodie') ||
            text.contains('beanie');

      case 3:
        return text.contains('shoe') ||
            text.contains('loafer') ||
            text.contains('boot') ||
            text.contains('sneaker');

      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (controller) {
        final favoriteItems = controller.favoriteProducts;

        final visibleItems = favoriteItems
            .where((product) => _matchesFilter(product, selectedFilter))
            .toList();

        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor: background,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: 45.h,
            leadingWidth: 40.w,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.arrow_back,
                color: textColor,
                size: 20.sp,
              ),
              onPressed: () => Get.back(),
            ),
            titleSpacing: 0,
            title: Row(
              children: [
                Text(
                  'Favorites',
                  style: Styles.textStyle16W500BodoniModa.copyWith(
                    color: textColor,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF282828),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    '${favoriteItems.length} Items',
                    style: TextStyle(
                      color: const Color(0xFFFFBB85),
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetsData.search,
                  width: 18.w,
                  height: 18.h,
                  colorFilter: const ColorFilter.mode(
                    textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AssetsData.IconButtonBag,
                    width: 18.w,
                    height: 18.h,
                    colorFilter: const ColorFilter.mode(
                      textColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ARCHIVED SELECTIONS',
                    style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                      color: const Color(0xFFDCC2B0),
                      fontSize: 8.sp,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Curated Pieces',
                        style: Styles.textStyle24W400BodoniModa.copyWith(
                          color: textColor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF222222),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.tune,
                              color: mutedColor,
                              size: 13.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Filter',
                              style: TextStyle(
                                color: mutedColor,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),

                  // Favorite filters
                  SizedBox(
                    height: 32.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: filters.length,
                      separatorBuilder: (_, __) => SizedBox(width: 8.w),
                      itemBuilder: (context, index) {
                        final isSelected = selectedFilter == index;

                        final count = favoriteItems
                            .where(
                              (product) => _matchesFilter(product, index),
                            )
                            .length;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? orangeColor
                                  : const Color(0xFF222222),
                              borderRadius: BorderRadius.circular(20.r),
                              border: isSelected
                                  ? null
                                  : Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.08,
                                      ),
                                    ),
                            ),
                            child: Text(
                              '${filters[index]} ($count)',
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : mutedColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Favorite products
                  Expanded(
                    child: visibleItems.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  color: mutedColor,
                                  size: 48.sp,
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  favoriteItems.isEmpty
                                      ? 'No favorite items yet'
                                      : 'No items in this category',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Your curated pieces will appear here.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: mutedColor,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: visibleItems.length,
                            itemBuilder: (context, index) {
                              final product = visibleItems[index];

                              // Discount prices are local because
                              // the API does not provide an old price.
                              final bool hasDiscount =
                                  index == 0 || index == 2;

                              return FavoriteProductCard(
                                product: product,
                                hasDiscount: hasDiscount,
                                onRemove: () {
                                  controller.removeFavorite(product);
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}