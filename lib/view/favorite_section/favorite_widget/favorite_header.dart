
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class FavoriteHeader extends StatelessWidget {
  const FavoriteHeader({
    super.key,
  });

  static const Color textColor = Color(0xFFE5E2E1);
  static const Color mutedColor = Color(0xFF92837A);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: Container(color:Color(0xff1C1B1B)
,                child: Row(
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
            ),
          ],
        ),
      ],
    );
  }
}
