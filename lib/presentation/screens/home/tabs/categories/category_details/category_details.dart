import 'package:flutter/material.dart';
import 'package:news_app/data_models/category_dm.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryItem});

  CategoryDM categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text(categoryItem.backendId),
    );
  }
}
