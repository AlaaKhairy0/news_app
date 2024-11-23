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
  static TextStyle articleSourceName = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF79828B),
  );
  static TextStyle articleTitle = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF42505C),
  );
  static TextStyle articlePublishedDate = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFA3A3A3),
  );
  static TextStyle selectedTabText = GoogleFonts.exo(
    color: ColorsManager.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle unSelectedTabText = GoogleFonts.exo(
    color: ColorsManager.green,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}
