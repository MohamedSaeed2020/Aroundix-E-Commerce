import 'dart:developer';

import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/core/helpers/ui_helpers.dart';
import 'package:e_commerce/core/shared/widgets/custom_button.dart';
import 'package:e_commerce/core/shared/widgets/custom_labeled_form_field.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/data_layer/models/product_models/product_variants_attributes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductModelsCard extends StatelessWidget {
  const ProductModelsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> price = [];

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
      child: Column(children: [
        Text(
          'Add Product Models',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        GetBuilder<ProductAddingController>(
          builder: (controller) {
            for (int i = 0;
                i <
                    controller.productSizes.length *
                        controller.productColorsModel.length;
                i++) {
              price.add(TextEditingController());
            }
            List<Widget> list = [];
            int counter = 0;
            for (int i = 0; i < controller.productSizes.length; i++) {
              for (int j = 0; j < controller.productColorsModel.length; j++) {
                list.add(Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomLabeledFormField(
                      enabled: false,
                      textInputType: TextInputType.number,
                      controller: TextEditingController(
                          text: controller.productSizes[i]),
                      labelText: 'Product Size',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomLabeledFormField(
                      enabled: false,
                      textInputType: TextInputType.number,
                      controller: TextEditingController(
                          text: controller.productColorsModel[j].colorName),
                      labelText: 'Product Color',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomLabeledFormField(
                      textInputType: TextInputType.number,
                      controller: price[counter],
                      labelText: 'Product Price',
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Product Price';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    if (counter !=
                        controller.productSizes.length *
                                controller.productColorsModel.length -
                            1)
                      const Divider(
                        color: AppColors.lightGreen,
                        thickness: 2,
                      ),
                  ],
                ));
                counter++;
              }
            }
            return Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: list,
                ),
                Visibility(
                  visible:controller.modelAttributes.isEmpty,
                  child: CustomButton(
                    pressed: () async {
                       int counter = 0;
                      for (var element in controller.modelAttributes) {
                       log('Attribute: $element');
                      }
                      bool isEmpty = false;
                      for (int i = 0;
                          i <
                              controller.productSizes.length *
                                  controller.productColorsModel.length;
                          i++) {
                        if (price[i].text.isEmpty) {
                          isEmpty = true;
                        }
                      }

                      if (isEmpty) {
                        UiHelpers.showSnackBar(
                            'You Should Enter Price For Each Model', 'error');
                      } else {
                        for (int i = 0; i < controller.productSizes.length; i++) {
                          for (int j = 0;
                              j < controller.productColorsModel.length;
                              j++) {
                            controller.addModels(VariantsAttributes(
                              variantPrice: price[counter].text,
                                variantColor:
                                    controller.productColorsModel[j].colorName,
                                variantSize: controller.productSizes[i]

                            ),
                            );
                            counter++;
                          }
                        }
                      }
                    },
                    text: 'Add Models',
                    backgroundColor: AppColors.primaryColor,
                    buttonColor: AppColors.whiteColor,
                  ),
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}
