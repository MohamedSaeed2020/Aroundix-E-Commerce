import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key, required this.title, required this.widget, this.pressed})
      : super(key: key);

  final String title;
  final Widget widget;
  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 10.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightRed,
                  ),
                ),
                SizedBox(height: 3.h),
                widget,
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: pressed,
                child: Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(7.w),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 10.w,
                  height: 10.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightRed,
                  ),
                  child: Icon(
                    Icons.close,
                    color: AppColors.whiteColor,
                    size: 8.w,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}