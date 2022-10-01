import 'package:e_commerce/data_layer/models/user_info_data_model.dart';
import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final UserIndoData userData;
  final String message;

  const UserInfoModel({required this.userData, required this.message});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      userData: UserIndoData.fromJson(json['user']),
      message: json['message'],
    );
  }

  @override
  List<Object> get props => [userData, message];
}
