import 'package:e_commerce/data_layer/models/user_info_model.dart';
import 'package:e_commerce/data_layer/web_services/user_info_web_services.dart';

class UserInfoRepository {
  final UserInfoWebService userInfoWebService;

  UserInfoRepository(this.userInfoWebService);

  Future<UserInfoModel> getUserInfo() async {
    Map<String, dynamic> data = await userInfoWebService.getUserInfo();
    return UserInfoModel.fromJson(data);
  }
}
