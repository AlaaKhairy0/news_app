import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/strings_manager.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key, required this.selectMenuItem});

  Function(DrawerItem) selectMenuItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: REdgeInsets.all(32),
            width: double.infinity,
            color: ColorsManager.green,
            child: Text(
              StringsManager.appTitle,
              style: AppStyle.drawerTitle,
            ),
          ),
          Padding(
            padding: REdgeInsets.all(12),
            child: Column(
              children: [
                buildDrawerMenuItem(
                    icon: Icons.list,
                    itemName: StringsManager.categories,
                    selectMenuItem: selectMenuItem,
                    item: DrawerItem.categories),
                SizedBox(
                  height: 8.h,
                ),
                buildDrawerMenuItem(
                    icon: Icons.settings,
                    itemName: StringsManager.settings,
                    selectMenuItem: selectMenuItem,
                    item: DrawerItem.settings),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDrawerMenuItem(
      {required IconData? icon,
      required String itemName,
      required Function(DrawerItem) selectMenuItem,
      required DrawerItem item}) {
    return InkWell(
      onTap: () {
        selectMenuItem(item);
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 32.sp,
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            itemName,
            style: AppStyle.drawerItem,
          )
        ],
      ),
    );
  }

}
enum DrawerItem{
  categories,
  settings
}