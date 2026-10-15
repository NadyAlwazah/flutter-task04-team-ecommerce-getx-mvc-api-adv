import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_view/widgets/search_grid_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_view/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SearchTextField(hintText: "Search")),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          const SearchGridView(),
        ],
      ),
    );
  }
}
