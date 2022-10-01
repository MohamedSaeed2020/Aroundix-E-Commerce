import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsDropDown extends StatelessWidget {
  const ColorsDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductAddingController>(builder: (controller) {
      return DropdownButtonFormField<ProductColorsModel>(
        hint: Text(controller.productColorsModel.isNotEmpty
            ? controller.productColorsModel.first.colorName.toString()
            : ''),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(18),
          labelText: 'Choose The Color',
          border: OutlineInputBorder(),
        ),
        dropdownColor: AppColors.whiteColor,
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),
        onChanged: (ProductColorsModel? productColorsModel) {
          controller.changeModelColor(productColorsModel!);
        },
        value: controller.selectedProductColorModel,
        items: controller.productColorsModel
            .map<DropdownMenuItem<ProductColorsModel>>(
                (ProductColorsModel productColorsModel) {
          return DropdownMenuItem<ProductColorsModel>(
            value: productColorsModel,
            child: Text(
              productColorsModel.colorName.toString(),
            ),
          );
        }).toList(),
      );
    });
  }
}
