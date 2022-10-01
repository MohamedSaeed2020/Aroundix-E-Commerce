import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/remote/api_end_points.dart';
import 'package:e_commerce/core/network/remote/dio_helper.dart';

class UserInfoWebService {
  Future<dynamic> getUserInfo() async {
    try {
      Response response = await DioHelper.getData(
        url: ApiEndPoints.userInfoEndPoint,
      );
      //log('UserWebService web success ${response.data.toString()}');
      return response.data;
    } on DioError catch (error) {
      log('UserWebService web error ${error.response}');
      throw 'UserWebService web error ${error.response}';
    }
  }
}
