import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/views/screens/add_product/components/add_remove_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ColorsCard extends StatelessWidget {
  const ColorsCard({super.key});

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
            'Add Colors',
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
              productAddingController
                  .showAddingProductImagesColorsDialog(context);
            },
            onRemovePressed: () {
              productAddingController.removeProductFromColorsNamesList();
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          GetBuilder<ProductAddingController>(builder: (controller) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.productColorsModel.length,
              itemBuilder: (context, modelIndex) {
                return Column(
                  children: [
                    Text(
                      controller.productColorsModel[modelIndex].colorName,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Wrap(
                      children: List.generate(
                          controller.productColorsModel[modelIndex]
                              .colorImagesFiles!.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.15,
                            backgroundColor: AppColors.primaryColor,
                            backgroundImage: FileImage(controller
                                .productColorsModel[modelIndex]
                                .colorImagesFiles![index]),
                          ),
                        );
                      }),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.greyColor,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
