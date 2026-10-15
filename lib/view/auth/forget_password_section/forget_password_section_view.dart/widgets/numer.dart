import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberCapsule extends StatelessWidget {
  final String number;
  final bool isActive;

  const NumberCapsule({super.key, required this.number, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isActive ? const Color(0xFF888888) : const Color(0xFF292929),
          width: 2,
        ),
      ),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 22,
          color: Color(0xFF858585),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
