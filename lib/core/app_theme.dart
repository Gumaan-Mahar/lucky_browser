import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      color: AppColors.secondaryColor,
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.textColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            30.r,
          ),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.greyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            30.r,
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.secondaryColor)
        .copyWith(background: AppColors.backgroundColor),
  );
}
