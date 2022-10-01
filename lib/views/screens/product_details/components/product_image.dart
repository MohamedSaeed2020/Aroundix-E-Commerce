import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    super.key,
  });

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInToLinear,
      ),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: GetBuilder<ProductsDetailsController>(builder: (controller) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.w),
              height: 25.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 3),
                    color: AppColors.greyColor,
                    blurRadius: 6,
                  )
                ],
              ),
              child: CarouselSlider(
                items: controller.productColorImages
                    .map(
                      (productColorImage) => CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.contain,
                        imageUrl: productColorImage,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: AppColors.shimmerBaseColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 25.h,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    controller.changeSliderIndicatorIndex(index);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 3.h,
              child: AnimatedSmoothIndicator(
                count: controller.productColorImages.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                  spacing: 2.w,
                  dotWidth: 4.w,
                  dotHeight: 4.w,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 0.5.w,
                  dotColor: AppColors.lightGreen,
                  activeDotColor: AppColors.lightGreen,
                ),
                activeIndex: controller.activeIndicatorIndex,
              ),
            ),
          ],
        );
      }),
    );
  }
}