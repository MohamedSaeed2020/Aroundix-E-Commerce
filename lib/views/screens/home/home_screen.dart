import 'package:e_commerce/controllers/logout_controller.dart';
import 'package:e_commerce/controllers/user_info_controller.dart';
import 'package:e_commerce/core/helpers/assets_paths.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/shared/widgets/title_text.dart';
import 'package:e_commerce/core/shared/widgets/traditional_app_bar.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/views/screens/home/components/user_info.dart';
import 'package:e_commerce/views/screens/home/components/product_item_card.dart';
import 'package:e_commerce/views/screens/home/components/user_info_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogOutController logOutController=Get.find<LogOutController>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: TraditionalAppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await logOutController.logOut(context);
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
      body: GetBuilder<UserInfoController>(
        builder: (controller) {
          return controller.isLoading
              ? const UserInfoShimmer()
              : Column(
                  children: [
                    UserInfo(
                      userName: controller.userName,
                      email: controller.userEmail,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: controller.userProducts.isNotEmpty
                            ? GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.userProducts.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1.h,
                                  crossAxisSpacing: 5.w,
                                  childAspectRatio: 0.75,
                                ),
                                itemBuilder: (context, index) =>
                                    ProductItemCard(
                                  product: controller.userProducts[index],
                                ),
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetsManager.noProducts,
                                      width: 40.w,
                                      height: 40.w,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const TitleText(
                                        text: "You Don't Have Any Products")
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addNewProductScreen);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
