import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/local/cache_helper.dart';
import 'package:e_commerce/core/network/local/storage_keys.dart';
import 'package:e_commerce/core/network/remote/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    bool accessToken = true,
  }) async {
    dio.options.method = "POST";
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken
          ? 'Bearer ${CacheHelper.getData(key: StorageKeys.accessToken)}'
          : '',
    };
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    bool accessToken = true,
  }) async {
    dio.options.method = "GET";
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken
          ? 'Bearer ${CacheHelper.getData(key: StorageKeys.accessToken)}'
          : '',
    };
    return await dio.get(
      url,
    );
  }
}