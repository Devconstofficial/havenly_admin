import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {

  static TextStyle blackTextStyle() => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kBlackTextColor1,
  );

  static TextStyle primaryTextStyle() => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: kPrimaryColor,
  );

  static TextStyle whiteTextStyle() => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: kWhiteColor,
  );

  static TextStyle greyTextStyle() => GoogleFonts.urbanist(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: kBgColor,
  );

  static BorderRadius get customBorder16=> BorderRadius.all(
    Radius.circular(16.r),
  );

}


