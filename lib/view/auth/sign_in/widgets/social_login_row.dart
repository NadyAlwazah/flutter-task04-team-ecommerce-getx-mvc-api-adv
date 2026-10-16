import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
    this.onApple,
    this.onGoogle,
    this.onFacebook,
  });

  final VoidCallback? onApple;
  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleButton(
          width: 56,
          height: 56,
          onTap: onApple,
          child: SvgPicture.asset(AssetsData.iconAppleSvg, width: 26.w),
        ),
        SizedBox(width: 24.w),
        CircleButton(
          width: 56,
          height: 56,
          onTap: onGoogle,
          child: SvgPicture.asset(AssetsData.iconGoogleSvg, width: 26.w),
        ),
        SizedBox(width: 24.w),
        CircleButton(
          width: 56,
          height: 56,
          onTap: onFacebook,
          child: SvgPicture.asset(AssetsData.iconFacebookSvg, width: 26.w),
        ),
      ],
    );
  }
}
