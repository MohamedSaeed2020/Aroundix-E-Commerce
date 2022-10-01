import 'dart:developer';

import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/helpers/ui_helpers.dart';
import 'package:e_commerce/core/network/local/cache_helper.dart';
import 'package:e_commerce/core/network/local/storage_keys.dart';
import 'package:e_commerce/data_layer/repositories/login_repo.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  final LoginRepo loginRepo;

  LoginController(this.loginRepo);

  void login(String email, String password) {
    isLoading == true;
    update();
    loginRepo.login(email, password).then((user) {
      isLoading == false;
      update();
      CacheHelper.saveData(
          key: StorageKeys.accessToken, value: user.accessToken);
      UiHelpers.showSnackBar('Logged In Successfully', 'success');
      Get.offAndToNamed(AppRoutes.homeScreen);
    }).catchError((error) {
      isLoading == false;
      update();
      UiHelpers.showSnackBar('Please enter valid email and password', 'error');
      log("Error in login LoginController: $error");
    });
  }
}
