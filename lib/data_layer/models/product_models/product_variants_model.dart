import 'package:e_commerce/data_layer/models/product_models/product_variants_attributes_model.dart';
import 'package:equatable/equatable.dart';

class ProductVariantsModel extends Equatable {
  final String variantId;
  final String productId;
  final String variantPrice;
  final VariantsAttributes variantsAttributes;

  const ProductVariantsModel({
    required this.variantId,
    required this.productId,
    required this.variantPrice,
    required this.variantsAttributes,
  });

  factory ProductVariantsModel.fromJson(Map<String, dynamic> json) {
    return ProductVariantsModel(
      variantId: json['_id'],
      productId: json['productId'],
      variantPrice: json['variantPrice'],
      variantsAttributes:
      VariantsAttributes.fromJson(json['variantAttributes']),
    );
  }

  @override
  List<Object> get props => [
    variantId,
    productId,
    variantPrice,
    variantsAttributes,
  ];
}