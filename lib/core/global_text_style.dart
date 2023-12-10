import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/core/app_colors.dart';

TextStyle globalTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 14.sp,
    color: color ?? AppColors.textColor,
    fontWeight: fontWeight ?? FontWeight.normal,
    decoration: TextDecoration.none,
    decorationThickness: 0,
  );
}
