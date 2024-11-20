import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
    color: ColorsManager.green,
    titleTextStyle: AppStyle.appTitle,
    centerTitle: true,
    iconTheme: const IconThemeData(color: ColorsManager.white,size: 30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(50.r),
      ),
    ),
  ));
}
