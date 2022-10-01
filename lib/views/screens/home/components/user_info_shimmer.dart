import 'package:e_commerce/core/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserInfoShimmer extends StatelessWidget {
  const UserInfoShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Column(
        children: [
          SizedBox(height: 3.h),
          Skeleton(
            height: 2.h,
            width: Get.width * 0.8,
          ),
          SizedBox(height: 1.h),
          Skeleton(
            height: 2.h,
            width: Get.width * 0.6,
          ),
          SizedBox(height: 3.h),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.h,
                crossAxisSpacing: 5.w,
                childAspectRatio: 2/2.5,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Skeleton(
                    height: 20.h,
                    width: 35.w,
                  ),
                  SizedBox(height: 1.h),
                  Skeleton(
                    height: 1.h,
                    width: 35.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
