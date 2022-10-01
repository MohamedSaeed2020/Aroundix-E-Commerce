import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final UserData userData;
  final String accessToken;
  final String message;

  const UserModel({
    required this.userData,
    required this.accessToken,
    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userData: UserData.fromJson(json['user']),
      accessToken: json['token'],
      message: json['message'],
    );
  }

  @override
  List<Object> get props => [userData, accessToken, message];
}

class UserData extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final List<String> productModel;

  const UserData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.productModel,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      productModel: List.of(json['products'])
          .map((product) => product.toString())
          .toList(),
    );
  }

  @override
  List<Object> get props => [id, fullName, email, productModel];
}
