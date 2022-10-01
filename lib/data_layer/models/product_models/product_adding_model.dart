import 'package:e_commerce/data_layer/models/product_models/product_options_model.dart';
import 'package:equatable/equatable.dart';

class ProductAddingModel extends Equatable {
  final String productId;
  final String productName;
  final ProductOptions productOptions;
  final List<String> productVariants;

  const ProductAddingModel({
    required this.productId,
    required this.productName,
    required this.productOptions,
    required this.productVariants,
  });

  factory ProductAddingModel.fromJson(Map<String, dynamic> json) {
    return ProductAddingModel(
      productId: json['_id'],
      productName: json['productName'],
      productOptions: ProductOptions.fromJson(json['productOptions']),
      productVariants: List.of(json['productVariants'])
          .map((colorImage) => colorImage.toString())
          .toList(),
    );
  }

  @override
  List<Object> get props =>
      [productId, productName, productOptions, productVariants,];
}
