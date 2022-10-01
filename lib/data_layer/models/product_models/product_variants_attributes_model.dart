import 'package:equatable/equatable.dart';

class VariantsAttributes extends Equatable {
  final String variantColor;
  final String variantSize;
  final String? variantPrice;

  const VariantsAttributes({
    required this.variantColor,
    required this.variantSize,
    this.variantPrice,
  });

  factory VariantsAttributes.fromJson(Map<String, dynamic> json) {
    return VariantsAttributes(
      variantColor: json['variantColor']['colorName'],
      variantSize: json['variantSize'],
    );
  }


  @override
  String toString() {
    return 'VariantsAttributes{variantColor: $variantColor, variantSize: $variantSize, variantPrice: $variantPrice}';
  }

  @override
  List<Object?> get props => [variantColor, variantSize, variantPrice];
}