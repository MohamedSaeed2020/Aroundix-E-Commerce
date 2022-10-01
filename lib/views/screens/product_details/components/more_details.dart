import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/shared/widgets/title_text.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/views/screens/product_details/components/available_colors.dart';
import 'package:e_commerce/views/screens/product_details/components/available_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreDetails extends StatelessWidget {

  const MoreDetails({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsDetailsController productsController = Get.find<ProductsDetailsController>();

    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .40,
      minChildSize: .30,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
              .copyWith(bottom: 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: AppColors.whiteColor,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: AppColors.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TitleText(text: productsController.productModel.productName, fontSize: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const TitleText(
                          text: "EGP ",
                          fontSize: 18,
                          color: AppColors.lightRed,
                        ),
                        GetBuilder<ProductsDetailsController>(builder: (controller) {
                          return TitleText(
                            text: controller.totalPrice,
                            fontSize: 25,
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AvailableSizes(
                  productSizes: productsController.productModel.productOptions.productSizes,
                ),
                AvailableColors(
                  productColors: productsController.productModel.productOptions.productColors,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    TitleText(
                      text: "Description",
                      fontSize: 14,
                    ),
                    SizedBox(height: 20),
                    Text(dummyDescription),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}