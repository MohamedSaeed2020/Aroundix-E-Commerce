import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.pressed, required this.text, this.backgroundColor=AppColors.whiteColor, this.buttonColor=AppColors.blackColor,})
      : super(key: key);
  final Function() pressed;
  final String text;
  final Color backgroundColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 7.h,
      margin: EdgeInsets.fromLTRB(0, 1.5.h, 0, 2.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.h)),
      child: ElevatedButton(
        onPressed: pressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.black26Color;
            }
            return backgroundColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: Text(
          text,
          style:  TextStyle(
            color: buttonColor,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
