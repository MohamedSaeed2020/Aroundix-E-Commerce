import 'package:e_commerce/data_layer/models/product_models/product_options_model.dart';
import 'package:e_commerce/data_layer/models/product_models/product_variants_model.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String productId;
  final String productName;
  final ProductOptions productOptions;
  final List<ProductVariantsModel> productVariants;

  const ProductModel({
    required this.productId,
    required this.productName,
    required this.productOptions,
    required this.productVariants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['_id'],
      productName: json['productName'],
      productOptions: ProductOptions.fromJson(json['productOptions']),
      productVariants: List.of(json['productVariants'])
          .map((productVariant) => ProductVariantsModel.fromJson(productVariant))
          .toList(),
    );
  }

  @override
  List<Object> get props => [
        productId,
        productName,
        productOptions,
        productVariants,
      ];
}