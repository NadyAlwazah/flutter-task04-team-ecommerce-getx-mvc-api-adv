import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingCollage extends StatelessWidget {
  const OnboardingCollage({super.key});

  static const double _width = 375;
  static const double _height = 475;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        width: _width,
        height: _height,
        child: Stack(
          children: [
            Positioned(
              left: 30,
              right: 30,
              top: 0,
              child: FittedBox(
                child: Text(
                  'FASHION',
                  style: GoogleFonts.bodoniModa(
                    fontSize: 80,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 6,
                    color: AppColors.watermark,
                  ),
                ),
              ),
            ),
            const _PhotoPill(
              left: 24,
              top: 48,
              width: 156,
              height: 394,
              asset: AssetsData.imageGirl1Png,
            ),
            const _PhotoPill(
              left: 197,
              top: 48,
              width: 155,
              height: 218,
              asset: AssetsData.imageBoyPng,
            ),
            const _PhotoPill(
              left: 197,
              top: 276,
              width: 155,
              height: 166,
              asset: AssetsData.imageGirl2Png,
            ),
            const _Ring(left: 288, top: 169, diameter: 128),
            const _Ring(left: -72, top: 317, diameter: 164),
            Positioned(
              left: 131,
              top: 37,
              child: SvgPicture.asset(AssetsData.iconStarWhiteSvg, width: 38),
            ),
            Positioned(
              left: 169,
              top: 433,
              child: SvgPicture.asset(AssetsData.iconStarOrangeSvg, width: 38),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoPill extends StatelessWidget {
  const _PhotoPill({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.asset,
  });

  final double left, top, width, height;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width / 2),
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class _Ring extends StatelessWidget {
  const _Ring({required this.left, required this.top, required this.diameter});

  final double left, top, diameter;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.orbitLine, width: 1),
        ),
      ),
    );
  }
}
