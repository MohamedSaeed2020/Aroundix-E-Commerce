import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TraditionalAppBar extends StatelessWidget {
  String? title;
  List<Widget>? actions;
   TraditionalAppBar({this.title,this.actions,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Text(title??'') ,
      backgroundColor: AppColors.primaryColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      actions: actions,
    );
  }
}
