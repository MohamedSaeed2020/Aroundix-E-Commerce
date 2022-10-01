import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UiHelpers {
  static void makeAppInPortraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static showSnackBar(String message, String status) {
    Get.snackbar(
      status == "error" ? 'Problem' : 'Alarm',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          status == "error" ? AppColors.lightRed : AppColors.lightGreen,
      borderRadius: 3.w,
      margin: EdgeInsets.all(8.w),
      colorText: AppColors.whiteColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}