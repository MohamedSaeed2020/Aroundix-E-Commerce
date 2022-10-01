import 'package:e_commerce/data_layer/models/product_models/product_model.dart';
import 'package:equatable/equatable.dart';

class UserIndoData extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final List<ProductModel> productModel;

  const UserIndoData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.productModel,
  });

  factory UserIndoData.fromJson(Map<String, dynamic> json) {
    return UserIndoData(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      productModel: List.of(json['products'])
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }

  @override
  List<Object> get props => [id, fullName, email, productModel];
}