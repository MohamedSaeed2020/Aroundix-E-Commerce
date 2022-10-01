import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/views/screens/add_product/components/add_remove_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SizesCard extends StatelessWidget {
  const SizesCard({super.key});

  @override
  Widget build(BuildContext context) {
    ProductAddingController productAddingController =
        Get.find<ProductAddingController>();

    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
      ),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Add Sizes',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          AddRemoveButtons(
            onAddPressed: () {
              productAddingController.showAddingProductSizesDialog(context);
            },
            onRemovePressed: () {
              productAddingController.removeProductFromSizesList();
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GetBuilder<ProductAddingController>(builder: (controller) {
            return SizedBox(
              height: 8.h,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children:
                    List.generate(controller.productSizes.length, (index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 3.w),
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(2.w)),
                      border: Border.all(
                        color: AppColors.greyColor,
                      ),
                    ),
                    child: Text(
                      controller.productSizes[index],
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}