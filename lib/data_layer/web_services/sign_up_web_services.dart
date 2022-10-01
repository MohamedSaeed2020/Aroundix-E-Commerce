import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/remote/api_end_points.dart';
import 'package:e_commerce/core/network/remote/dio_helper.dart';

class SignUpWebServices {
  Future<dynamic> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiEndPoints.registerEndPoint,
        data: {
          'fullName': fullName,
          'email': email,
          'password': password,
        },
      );
      //log('SignUpWebServices web success ${response.data.toString()}');
      return response.data;
    } on DioError catch (error) {
      log('SignUpWebServices web error ${error.response}');
      throw 'SignUpWebServices web error ${error.response}';
    }
  }
}
