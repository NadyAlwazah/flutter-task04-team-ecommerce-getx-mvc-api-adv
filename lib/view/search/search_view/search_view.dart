import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_view/widgets/search_view_body.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleButton(
            onTap: () => Get.back(),
            backgroundColor: const Color(0xFF0F0F0F).withValues(alpha: .16),
            child: SvgPicture.asset(AssetsData.iconArrowBackSvg),
          ),
        ),
        title: Text(
          "Find Products",
          style: Styles.textStyle28W500BodoniModa.copyWith(
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),

      body: const SearchViewBody(),
    );
  }
}
