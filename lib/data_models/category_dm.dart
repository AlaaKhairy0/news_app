import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/constants_manager.dart';
import 'package:news_app/core/strings_manager.dart';

class CategoryDM {
  String backendId;

  String title;

  String imagePath;

  Color color;

  CategoryDM(
      {required this.imagePath,
      required this.title,
      required this.backendId,
      required this.color});

  static List<CategoryDM> getCategoriesList() => [
        CategoryDM(
            imagePath: AssetsManager.general,
            title: StringsManager.general,
            backendId: ConstantsManager.generalId,
            color: ColorsManager.purple),
        CategoryDM(
            imagePath: AssetsManager.sports,
            title: StringsManager.sports,
            backendId: ConstantsManager.sportsId,
            color: ColorsManager.red),
        CategoryDM(
            imagePath: AssetsManager.science,
            title: StringsManager.science,
            backendId: ConstantsManager.scienceId,
            color: ColorsManager.yellow),
        CategoryDM(
            imagePath: AssetsManager.entertainment,
            title: StringsManager.entertainment,
            backendId: ConstantsManager.entertainmentId,
            color: ColorsManager.lightBlue),
        CategoryDM(
            imagePath: AssetsManager.health,
            title: StringsManager.health,
            backendId: ConstantsManager.healthId,
            color: ColorsManager.pink),
        CategoryDM(
            imagePath: AssetsManager.business,
            title: StringsManager.business,
            backendId: ConstantsManager.businessId,
            color: ColorsManager.brown),
        CategoryDM(
            imagePath: AssetsManager.technology,
            title: StringsManager.technology,
            backendId: ConstantsManager.technologyId,
            color: ColorsManager.darkBlue),
      ];
}
