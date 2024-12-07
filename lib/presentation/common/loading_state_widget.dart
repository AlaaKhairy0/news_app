import 'package:flutter/material.dart';
import 'package:news_app/core/colors_manager.dart';

class LoadingWidget extends StatelessWidget {
   LoadingWidget({super.key,this.loadingMessage});
  String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        if(loadingMessage != null)
          Text(loadingMessage!),
        Center(child: CircularProgressIndicator(color: ColorsManager.green,)),
      ],),
    );
  }
}
