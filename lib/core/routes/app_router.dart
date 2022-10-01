import 'package:e_commerce/views/screens/add_product/add_product_screen.dart';
import 'package:e_commerce/views/screens/home/home_screen.dart';
import 'package:e_commerce/views/screens/product_details/product_details_screen.dart';
import 'package:get/get.dart';
import 'package:e_commerce/views/screens/login_screen.dart';
import 'package:e_commerce/views/screens/sign_up_screen.dart';
import 'package:e_commerce/views/screens/splash_screen.dart';

class AppRoutes {
  static String initialRoute = "/splash-screen";
  static String signUpScreen = "/signUp-screen";
  static String loginScreen = "/login-screen";
  static String homeScreen = "/home-screen";
  static String addNewProductScreen = "/addNewProduct-screen";
  static String productDetailsScreen = "/productDetailsScreen-screen";

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: addNewProductScreen, page: () => const AddNewProductScreen()),
    GetPage(name: productDetailsScreen, page: () =>  const ProductDetailsScreen()),
  ];
}
