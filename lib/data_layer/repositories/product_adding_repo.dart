import 'package:e_commerce/data_layer/models/product_models/product_adding_model.dart';
import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:e_commerce/data_layer/models/product_models/product_variants_attributes_model.dart';
import 'package:e_commerce/data_layer/web_services/product_adding_web_services.dart';

class ProductAddingRepository {
  final ProductAddingWebServices productAddingWebServices;

  ProductAddingRepository(this.productAddingWebServices);

  Future<ProductAddingModel> addProduct({
    required String productName,
    required List<ProductColorsModel> productColorsModel,
    required List<String> productSizes,
    required List<VariantsAttributes> productVariantsAttributes,
  }) async {
    Map<String, dynamic> data = await productAddingWebServices.addProduct(
      productName: productName,
      productColorsModel: productColorsModel,
      productSizes: productSizes,
      productVariantsAttributes: productVariantsAttributes,
    );
    return ProductAddingModel.fromJson(data);
  }
}
