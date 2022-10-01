import 'package:e_commerce/controllers/logout_controller.dart';
import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/controllers/products_details_controller.dart';
import 'package:e_commerce/controllers/user_info_controller.dart';
import 'package:e_commerce/data_layer/repositories/login_repo.dart';
import 'package:e_commerce/data_layer/repositories/product_adding_repo.dart';
import 'package:e_commerce/data_layer/repositories/sign_up_repo.dart';
import 'package:e_commerce/data_layer/repositories/user_info_repo.dart';
import 'package:e_commerce/data_layer/web_services/login_web_services.dart';
import 'package:e_commerce/data_layer/web_services/product_adding_web_services.dart';
import 'package:e_commerce/data_layer/web_services/sign_up_web_services.dart';
import 'package:e_commerce/data_layer/web_services/user_info_web_services.dart';
import 'package:get/instance_manager.dart';
import 'package:e_commerce/controllers/login_controller.dart';
import 'package:e_commerce/controllers/sign_up_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(LoginRepo(LoginWebServices())),
      fenix: true,
    );

    Get.lazyPut(
      () => SignUpController(SignUpRepo(SignUpWebServices())),
      fenix: true,
    );

    Get.lazyPut(
      () => UserInfoController(UserInfoRepository(UserInfoWebService())),
      fenix: true,
    );
    Get.lazyPut(
      () => ProductsDetailsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ProductAddingController(
          ProductAddingRepository(ProductAddingWebServices())),
      fenix: true,
    );
    Get.lazyPut(
      () => LogOutController(),
      fenix: true,
    );
  }
}
