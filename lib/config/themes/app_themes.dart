import 'package:chatting_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    canvasColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.grey700,
      brightness: Brightness.light,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
      displayMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      displaySmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      headlineLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      headlineMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
      bodyLarge: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
      bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
      bodySmall: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
      labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      labelMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
      labelSmall: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.grey700,
        foregroundColor: AppColors.white,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.black,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.black,
        side: BorderSide(color: AppColors.primary, width: 1.w),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey400,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.border, width: 1.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.border, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.grey700, width: 1.5.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp),
      labelStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp),
    ),

    // Card Theme
    // cardTheme: CardTheme(
    //   elevation: 2,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    //   color: AppColors.white,
    //   shadowColor: AppColors.shadow,
    // ),

    dividerTheme: DividerThemeData(color: AppColors.divider, thickness: 1.h),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    canvasColor: AppColors.backgroundDark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textOnDark,
      elevation: 4,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColors.textOnDark),
      displayMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
      displaySmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
      headlineLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
      headlineMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.textOnDark),
      titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
      bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.textOnDark),
      labelLarge: TextStyle(fontSize: 14.sp, color: AppColors.textOnDark),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey800,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.grey600, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primary, width: 2.w),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      hintStyle: TextStyle(color: AppColors.grey400, fontSize: 14.sp),
    ),
  );
}
