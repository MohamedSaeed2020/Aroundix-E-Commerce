import 'package:e_commerce/data_layer/models/user_model.dart';
import 'package:e_commerce/data_layer/web_services/login_web_services.dart';

class LoginRepo {
  final LoginWebServices loginWebServices;

  LoginRepo(this.loginWebServices);

  Future<UserModel> login(String email, String password) async {
    Map<String, dynamic> data = await loginWebServices.login(email, password);
    return UserModel.fromJson(data);
  }
}
