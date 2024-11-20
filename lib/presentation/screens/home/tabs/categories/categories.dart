import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_models/category_dm.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/wigdets/category_item.dart';

typedef OnCategoryClicked =void Function(CategoryDM category);
class Categories extends StatelessWidget {
  Categories({super.key,required this.onCategoryClicked});
  OnCategoryClicked onCategoryClicked;

  List<CategoryDM> categoriesList = CategoryDM.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 20,right: 20,left:20 ,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
            style: AppStyle.categoryHeader,
          ),
          SizedBox(height: 16.h,),
          Expanded(
            child: GridView.builder(
              itemCount: categoriesList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:25 ,crossAxisSpacing:25 ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClicked(categoriesList[index]);
                  },
                  child: CategoryItem(
                      categoryItem: categoriesList[index], index: index)),
            ),
          )
        ],
      ),
    );
  }
}
