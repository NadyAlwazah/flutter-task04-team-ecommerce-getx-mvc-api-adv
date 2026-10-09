import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  //! Bodoni Moda

  static TextStyle get textStyle28W500BodoniModa =>
      GoogleFonts.bodoniModa(fontSize: 28.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle24W400BodoniModa =>
      GoogleFonts.bodoniModa(fontSize: 24.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle20W500BodoniModa =>
      GoogleFonts.bodoniModa(fontSize: 20.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle18W400BodoniModa =>
      GoogleFonts.bodoniModa(fontSize: 18.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle16W500BodoniModa =>
      GoogleFonts.bodoniModa(fontSize: 16.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle13W400BodoniModa =>
      GoogleFonts.bodoniModa(fontSize: 13.sp, fontWeight: FontWeight.w400);

  //! Plus Jakarta Sans

  static TextStyle get textStyle16W500PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 16.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle14W500PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 14.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle14W600PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 14.sp, fontWeight: FontWeight.w600);

  static TextStyle get textStyle13W400PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 13.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle12W500PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 12.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle11W500PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 11.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle10W600PlusJakartaSans =>
      GoogleFonts.plusJakartaSans(fontSize: 10.sp, fontWeight: FontWeight.w600);

  //! Clash Display
  static TextStyle get textStyle34W500ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 34.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get textStyle32W600ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle get textStyle30W500ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get textStyle24W500ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get textStyle20W600ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get textStyle18W600ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get textStyle16W500ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get textStyle14W500ClashDisplay => TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
