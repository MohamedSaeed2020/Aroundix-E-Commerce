import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/remote/api_end_points.dart';
import 'package:e_commerce/core/network/remote/dio_helper.dart';

class LoginWebServices {
  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiEndPoints.loginEndPoint,
        data: {
          'email': email,
          'password': password,
        },
      );
      //log('LoginWebServices web success ${response.data.toString()}');
      return response.data;
    } on DioError catch (error) {
      log('LoginWebServices web error ${error.response}');
      throw 'LoginWebServices web error ${error.response}';
    }
  }
}
