import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/views/screens/product_details/components/color_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductColors extends StatelessWidget {

  const ProductColors({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsDetailsController productsController = Get.find<ProductsDetailsController>();

    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Available Colors'),
      children: [
        Container(
          height: 5.h,
          padding: EdgeInsets.only(left: 5.w),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: productsController.productModel.productOptions.productColors.length,
            itemBuilder: (context, index) {
              return ColorItem(
                productColors: productsController.productModel.productOptions.productColors[index],
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 2.w,
              );
            },
          ),
        )
      ],
    );
  }
}