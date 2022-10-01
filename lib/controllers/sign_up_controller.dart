import 'dart:developer';

import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/helpers/ui_helpers.dart';
import 'package:e_commerce/core/network/local/cache_helper.dart';
import 'package:e_commerce/core/network/local/storage_keys.dart';
import 'package:e_commerce/data_layer/repositories/sign_up_repo.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  final SignUpRepo signUpRepo;

  SignUpController(this.signUpRepo);

  void signUp({
    required String fullName,
    required String email,
    required String password,
  }) {
    isLoading == true;
    update();
    signUpRepo
        .signUp(
      fullName: fullName,
      email: email,
      password: password,
    )
        .then((user) {
      isLoading == false;
      update();
      CacheHelper.saveData(
          key: StorageKeys.accessToken, value: user.accessToken);
      UiHelpers.showSnackBar(user.message.toString(), 'success');
      Get.offAndToNamed(AppRoutes.homeScreen);
    }).catchError((error) {
      isLoading == false;
      update();
      UiHelpers.showSnackBar('User already exists', 'error');
      log("Error in login SignUpController: $error");
    });
  }
}
