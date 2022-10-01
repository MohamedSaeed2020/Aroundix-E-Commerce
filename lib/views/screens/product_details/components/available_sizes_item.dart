import 'package:e_commerce/core/shared/widgets/title_text.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvailableSizesItem extends StatelessWidget {
  final String size;

  const AvailableSizesItem({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.iconColor,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color: AppColors.whiteColor,
      ),
      child: Center(
        child: TitleText(
          text: size,
          fontSize: 14.sp,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
