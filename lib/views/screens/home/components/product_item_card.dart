import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/data_layer/models/product_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetailsScreen, arguments: product);
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(3.w),
              height: 170.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [BoxShadow(offset: Offset(3, 3),color: AppColors.greyColor,blurRadius: 6)],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: CachedNetworkImage(
                  width: 120.0,
                  fit: BoxFit.cover,
                  imageUrl:
                      product.productOptions.productColors[0].colorImages![0],
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: const Color(0xffE3E3E3),
                    highlightColor: const Color(0xffFAFAFA),
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              product.productName,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
