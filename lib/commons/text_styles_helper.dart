import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_test_app/commons/colors_helper.dart';

class TextStylesHelper{
  static TextStyle valueStyle = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25.sp,
  );
  static TextStyle nameCharacter = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5.sp,
  );
  static TextStyle genderStyle = TextStyle(
    color: ColorsHelper.gray3,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5.sp,
  );
  static TextStyle nameInfoCharacter = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 34.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25.sp,
  );
  static TextStyle descriptionStyle = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5.sp,
  );
}