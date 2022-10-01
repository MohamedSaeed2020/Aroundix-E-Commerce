import 'dart:async';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/helpers/assets_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logoAppearance = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Get.offAndToNamed(AppRoutes.loginScreen);
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          logoAppearance = !logoAppearance;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.topGradientColor,
              AppColors.middleGradientColor,
              AppColors.bottomGradientColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedContainer(
            width: logoAppearance ? 50.w : 0,
            height: logoAppearance ? 50.w : 0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Image.asset(
              AssetsManager.logo,
              width: logoAppearance ? 50.w : 0,
              height: logoAppearance ? 50.w : 0,
            ),
          ),
        ),
      ),
    );
  }
}