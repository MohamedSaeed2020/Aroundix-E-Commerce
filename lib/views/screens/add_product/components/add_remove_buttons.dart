import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddRemoveButtons extends StatelessWidget {
  const AddRemoveButtons(
      {Key? key, required this.onAddPressed, required this.onRemovePressed})
      : super(key: key);

  final Function() onAddPressed;
  final Function() onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onAddPressed,
          child: Container(
            alignment: Alignment.center,
            width: 10.w,
            height: 10.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGreen,
            ),
            child: Icon(
              Icons.add,
              color: AppColors.whiteColor,
              size: 8.w,
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        GestureDetector(
          onTap: onRemovePressed,
          child: Container(
            alignment: Alignment.center,
            width: 10.w,
            height: 10.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightRed,
            ),
            child: Icon(
              Icons.remove,
              color: AppColors.whiteColor,
              size: 8.w,
            ),
          ),
        ),
      ],
    );
  }
}