import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/views/screens/product_details/components/variant_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductVariants extends StatelessWidget {

  const ProductVariants({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsDetailsController productsController = Get.find<ProductsDetailsController>();

    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Select Product Model'),
      children: [
        Container(
          height: 15.h,
          padding: EdgeInsets.only(left: 5.w),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: productsController.productModel.productVariants.length,
            itemBuilder: (context, index) {
              return VariantItem(
                productVariantsModel: productsController.productModel.productVariants[index],
                variantIndex: index,
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