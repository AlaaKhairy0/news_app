import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/data_models/category_dm.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.categoryItem, required this.index});

  CategoryDM categoryItem;

  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      height: 171.h,
      decoration: BoxDecoration(
          color: categoryItem.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(index.isEven ? 0 : 25.r),
            bottomLeft: Radius.circular(index.isEven ? 25.r :0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryItem.imagePath,
            width: 132.w,
            height: 116.h,
          ),
          Text(categoryItem.title,style: AppStyle.categoryItemTitle,)
        ],
      ),
    );
  }
}
