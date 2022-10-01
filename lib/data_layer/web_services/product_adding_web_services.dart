import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:e_commerce/core/network/remote/api_end_points.dart';
import 'package:e_commerce/core/network/remote/dio_helper.dart';
import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:e_commerce/data_layer/models/product_models/product_variants_attributes_model.dart';

class ProductAddingWebServices {
  Future<dynamic> addProduct({
    required String productName,
    required List<ProductColorsModel> productColorsModel,
    required List<String> productSizes,
    required List<VariantsAttributes> productVariantsAttributes,

  }) async {
    try {
      Map<String,dynamic> dataMap = {};
      final colorMap = {};
      final imageMap = {};
      final sizeMap = {};
      final variantMap = {};

      ///Name
      final mameMap = {'productName': productName};
     ///Color Name
      for (int i = 0; i < productColorsModel.length; i++) {
        colorMap['productColors${[i]}${'[colorName]'}'] =
            productColorsModel[i].colorName;
      }
      ///Color Images
      for (int i = 0; i < productColorsModel.length; i++) {
        for (int j = 0; j < productColorsModel[i].colorImagesFiles!.length; j++) {
          imageMap['productColors${[i]}[colorImages]${[j]}'] =
          await dio.MultipartFile.fromFile(
            productColorsModel[i].colorImagesFiles![j].path,
            filename: productColorsModel[i]
                .colorImagesFiles![j]
                .path
                .split('/')
                .last,
            contentType: MediaType("image", "jpg"),

          );
        }
      }
     ///Product Sizes
      for (int i = 0; i < productSizes.length; i++) {
        sizeMap['productSizes${[i]}'] = productSizes[i];
      }

      ///Product VariantsAttributes
      for (int i = 0; i < productVariantsAttributes.length; i++) {
        variantMap['productVariations${[i]}${'[variantPrice]'}'] =
        productVariantsAttributes[i].variantPrice!;
        variantMap[
        'productVariations${[i]}${'[variantAttributes][variantSize]'}'] =
            productVariantsAttributes[i].variantSize;
        variantMap['productVariations${[
          i
        ]}${'[variantAttributes][variantColor][colorName]'}'] =
            productVariantsAttributes[i].variantColor;
      }

      dataMap = {
        ...imageMap,
        ...mameMap,
        ...colorMap,
        ...sizeMap,
        ...variantMap,
      };
      dio.FormData formData = dio.FormData.fromMap(dataMap);

      dio.Response response = await DioHelper.postData(
        url: ApiEndPoints.addProductEndPoint,
        data: formData,
      );
      //log('ProductAddingWebServices web success ${response.data.toString()}');
      return response.data['product'];
    } on DioError catch (error) {
      log('ProductAddingWebServices web error ${error.response}');
      throw 'ProductAddingWebServices web error ${error.response}';
    }
  }
}