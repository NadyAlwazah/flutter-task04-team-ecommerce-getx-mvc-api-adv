
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteEmptyState extends StatelessWidget {
  const FavoriteEmptyState({
    super.key,
    required this.hasFavorites,
  });

  final bool hasFavorites;

  static const Color textColor = Color(0xFFE5E2E1);
  static const Color mutedColor = Color(0xFF92837A);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
              hasFavorites
                  ? 'No items in this category'
                  : 'No favorite items yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
