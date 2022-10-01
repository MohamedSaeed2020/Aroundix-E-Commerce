import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:e_commerce/data_layer/models/product_models/product_model.dart';
import 'package:get/get.dart';

class ProductsDetailsController extends GetxController {
  String totalPrice = '';
  List<ProductColorsModel> productColorsModel = [];
  List<String> productColorImages = [];
  late ProductModel productModel;
  int variantIndex = 0;
  int colorIndex = 0;
  int activeIndicatorIndex = 0;

  @override
  void onInit() {
    productModel = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    totalPrice = productModel.productVariants.first.variantPrice;
    productColorsModel = productModel.productOptions.productColors;
    productColorImages =
        productModel.productOptions.productColors.first.colorImages!;
    update();
    super.onReady();
  }

  void changeTotalPriceBasedOnModel(String variantPrice, int index) {
    totalPrice = variantPrice;
    variantIndex = index;
    update();
  }

  void changeProductImagesBasedOnColor(String productColor, int index) {
    ProductColorsModel model = productColorsModel
        .where((element) => element.colorName == productColor)
        .toList().first;
    productColorImages=model.colorImages!;
    colorIndex = index;
    update();
  }

  void changeSliderIndicatorIndex(int index) {
    activeIndicatorIndex = index;
    update();
  }
}
