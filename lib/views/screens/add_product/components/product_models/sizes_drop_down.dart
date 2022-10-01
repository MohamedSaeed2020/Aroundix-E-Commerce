import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizesDropDown extends StatelessWidget {
  const SizesDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductAddingController>(builder: (controller) {
      return DropdownButtonFormField<String>(
        hint: Text(controller.productSizes.isNotEmpty
            ? controller.productSizes.first.toString()
            : '',),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(18),
          labelText: 'Choose The Size',
          border: OutlineInputBorder(),
        ),
        dropdownColor: AppColors.whiteColor,
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),
        onChanged: (String? size) {
          controller.changeModelSize(size!);
        },
        value: controller.selectedSize,
        items: controller.productSizes
            .map<DropdownMenuItem<String>>((String size) {
          return DropdownMenuItem<String>(
            value: size,
            child: Text(
              size.toString(),
            ),
          );
        }).toList(),
      );
    });
  }
}
