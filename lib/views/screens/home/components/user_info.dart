import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserInfo extends StatelessWidget {
  final String userName;
  final String email;

  const UserInfo({Key? key, required this.userName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 20.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            '"$email"',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyColor,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: const Divider(
                  color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
