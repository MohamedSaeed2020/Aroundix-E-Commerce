import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/views/screens/product_details/components/more_details.dart';
import 'package:e_commerce/views/screens/product_details/components/product_image.dart';
import 'package:e_commerce/views/screens/product_details/components/product_variants.dart';
import 'package:e_commerce/views/screens/product_details/components/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              AppColors.productDetailsTopGradientColor,
              AppColors.productDetailsBottomGradientColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      const ProductImage(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 8.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const ProductColors(),
                  const ProductVariants(),
                ],
              ),
              const MoreDetails()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.shopping_basket,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
      ),
    );
  }
}
