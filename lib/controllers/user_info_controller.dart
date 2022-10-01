import 'dart:developer';
import 'package:e_commerce/data_layer/models/product_models/product_model.dart';
import 'package:e_commerce/data_layer/repositories/user_info_repo.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  final UserInfoRepository userInfoRepository;
  bool isLoading = false;
  List<ProductModel> userProducts = [];
  String userName = "";
  String userEmail = "";
  UserInfoController(this.userInfoRepository);

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async {
    isLoading = true;
    update();
    await userInfoRepository.getUserInfo().then((userInfo) {
      isLoading = false;
      update();
      userProducts = userInfo.userData.productModel;
      userName = userInfo.userData.fullName;
      userEmail = userInfo.userData.email;
    }).catchError((error) {
      isLoading = false;
      update();
      log("Error in getUserInfo UserInfoController: $error");
    });
  }
}
