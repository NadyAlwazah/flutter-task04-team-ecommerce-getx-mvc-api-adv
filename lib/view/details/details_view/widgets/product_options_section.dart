import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class ProductOptionsSection extends StatefulWidget {
  const ProductOptionsSection({super.key});

  @override
  State<ProductOptionsSection> createState() => _ProductOptionsSectionState();
}

class _ProductOptionsSectionState extends State<ProductOptionsSection> {
  // القيم المتاحة
  final colors = [
    Colors.teal.shade900,
    Colors.grey.shade900,
    Colors.indigo.shade900,
  ];

  final sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  late Color selectedColor = colors.first;
  String selectedSize = 'XL';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: const Color(0xFF202020)),
        // الخطوط المائلة في الخلفية
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(-0.97, -0.75),
          tileMode: TileMode.repeated,
          colors: [
            Colors.black,
            Colors.black,
            Color(0xFF202020),
            Color(0xFF202020),
          ],
          stops: [0, 0.88, 0.88, 1],
        ),
      ),
      child: Row(
        children: [
          // COLOR
          Text(
            'COLOR',
            style: Styles.textStyle16W500ClashDisplay.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w),
          DropdownButtonHideUnderline(
            child: DropdownButton<Color>(
              value: selectedColor,
              dropdownColor: Colors.black,
              icon: const Icon(Icons.expand_more, color: Colors.white),
              items: [
                for (final c in colors)
                  DropdownMenuItem(
                    value: c,
                    child: Container(
                      width: 40.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: c,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                  ),
              ],
              onChanged: (c) => setState(() => selectedColor = c!),
            ),
          ),

          const Spacer(),
          Container(width: 1, height: 38, color: Colors.white24),
          const Spacer(),

          //SIZE
          Text(
            'SIZE:',
            style: Styles.textStyle16W500ClashDisplay.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSize,
              dropdownColor: Colors.black,
              style: Styles.textStyle16W500ClashDisplay.copyWith(
                color: Colors.white,
              ),
              icon: const Icon(Icons.expand_more, color: Colors.white),
              items: [
                for (final s in sizes)
                  DropdownMenuItem(value: s, child: Text(s)),
              ],
              onChanged: (s) => setState(() => selectedSize = s!),
            ),
          ),
        ],
      ),
    );
  }
}
