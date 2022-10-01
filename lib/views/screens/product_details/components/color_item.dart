import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ColorItem extends StatelessWidget {
  final ProductColorsModel productColors;
  final int index;

  const ColorItem({Key? key, required this.productColors, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsDetailsController>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.changeProductImagesBasedOnColor(
              productColors.colorName, index);
        },
        child: Container(
          width: Get.width * 0.30,
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.colorIndex == index
                  ? AppColors.lightGreen
                  : AppColors.greyColor,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            color: AppColors.lightGrey,
            child: Text(
              productColors.colorName,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    });
  }
}
