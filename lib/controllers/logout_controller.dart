import 'package:e_commerce/core/network/local/cache_helper.dart';
import 'package:e_commerce/core/network/local/storage_keys.dart';
import 'package:e_commerce/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutController extends GetxController {
  Future<void> logOut(BuildContext context) async {
    CacheHelper.removeData(key: StorageKeys.accessToken);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }
}
