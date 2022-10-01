import 'package:e_commerce/core/shared/widgets/custom_button.dart';
import 'package:e_commerce/core/shared/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce/controllers/sign_up_controller.dart';
import 'package:e_commerce/core/helpers/assets_paths.dart';
import 'package:e_commerce/core/helpers/extensions.dart';
import 'package:e_commerce/core/helpers/ui_helpers.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomGradientColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                5.w, Get.height * 0.20, 5.w, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  AssetsManager.login,
                  fit: BoxFit.fitWidth,
                  width: 35.w,
                  height: 35.w,
                  //color: Colors.white,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  controller: _fullNameTextEditingController,
                  prefixIcon: Icons.person_outline,
                  labelText: 'Enter UserName',
                  isPasswordType: false,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  controller: _emailTextEditingController,
                  prefixIcon: Icons.email_outlined,
                  labelText: 'Enter Email',
                  isPasswordType: false,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.visiblePassword,
                  controller: _passwordTextEditingController,
                  prefixIcon: Icons.lock,
                  labelText: 'Enter Password',
                  isPasswordType: true,
                ),
                SizedBox(
                  height: 3.h,
                ),
                GetBuilder<SignUpController>(builder: (controller) {
                  return CustomButton(
                    text: 'Sign Up',
                    pressed: () {
                      if (_fullNameTextEditingController.text.isEmpty) {
                        UiHelpers.showSnackBar(
                            'Please Enter Your Name', 'error');
                      } else if (!_emailTextEditingController.text
                              .isValidEmail() ||
                          _emailTextEditingController.text.isEmpty) {
                        UiHelpers.showSnackBar(
                            'Please Enter Valid Email', 'error');
                      } else if (_passwordTextEditingController.text.length <
                          6) {
                        UiHelpers.showSnackBar(
                            'Please Enter Password Of 6 Characters At Least',
                            'error');
                      } else {
                        controller.signUp(
                          fullName: _fullNameTextEditingController.text,
                          email: _emailTextEditingController.text,
                          password: _passwordTextEditingController.text,
                        );
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
}
