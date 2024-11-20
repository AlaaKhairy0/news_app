import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';

class AppStyle {
  static TextStyle appTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle drawerTitle = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.white,
  );
  static TextStyle drawerItem = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackAccent,
  );
  static TextStyle categoryHeader = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.grey,
  );
  static TextStyle categoryItemTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle settingsTitle = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackAccent,
  );
  static TextStyle settingsSelectedItem = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.green,
  );
}
