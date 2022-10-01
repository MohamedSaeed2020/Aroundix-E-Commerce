import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:equatable/equatable.dart';

class ProductOptions extends Equatable {
  final List<String> productSizes;
  final List<ProductColorsModel> productColors;

  const ProductOptions({
    required this.productSizes,
    required this.productColors,
  });

  factory ProductOptions.fromJson(Map<String, dynamic> json) {
    return ProductOptions(
      productSizes: List.of(json['productSizes'])
          .map((productSize) => productSize.toString())
          .toList(),
      productColors: List.of(json['productColors'])
          .map((productColor) => ProductColorsModel.fromJson(productColor))
          .toList(),
    );
  }

  @override
  List<Object> get props => [productSizes, productColors];
}