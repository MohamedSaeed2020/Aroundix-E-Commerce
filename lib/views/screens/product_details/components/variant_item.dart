import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/data_layer/models/product_models/product_variants_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VariantItem extends StatelessWidget {
  final ProductVariantsModel productVariantsModel;
  final int variantIndex;

  const VariantItem(
      {Key? key,
      required this.productVariantsModel,
      required this.variantIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsDetailsController>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.changeTotalPriceBasedOnModel(
            productVariantsModel.variantPrice,
            variantIndex,
          );
        },
        child: Container(
          height: 15.h,
          width: Get.width * 0.40,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5.w,
              color: controller.variantIndex==variantIndex?AppColors.lightGreen:AppColors.greyColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 3.w),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 5.h,
                decoration:  BoxDecoration(
                    color: AppColors.lightGrey,
                    border: Border(
                      bottom: BorderSide(
                        color: controller.variantIndex==variantIndex?AppColors.lightGreen:AppColors.greyColor,
                      ),
                    )),
                child: Text(
                  '${productVariantsModel.variantsAttributes.variantSize} GB',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EGP ${productVariantsModel.variantPrice}',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      productVariantsModel.variantsAttributes.variantColor
                          .toUpperCase(),
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
