import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: AppStyle.settingsTitle,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            padding: REdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorsManager.white,
                border: Border.all(
                  color: ColorsManager.green,
                  width: 1.w,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedLang,style: AppStyle.settingsSelectedItem,),
                buildDropDownMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDownMenu() {
    return DropdownButton<String>(
      underline: Container(),
      isDense: true,
      icon: Icon(
        Icons.arrow_drop_down_outlined,
        color: ColorsManager.green,
        size: 26.sp,
      ),
      items: <String>['English', 'العربية'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newLang) {
        selectedLang = newLang ?? selectedLang;
        setState(() {});
      },
    );
  }
}
