import 'package:e_commerce/data_layer/models/user_model.dart';
import 'package:e_commerce/data_layer/web_services/sign_up_web_services.dart';

class SignUpRepo {
  final SignUpWebServices signUpWebServices;

  SignUpRepo(this.signUpWebServices);

  Future<UserModel> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = await signUpWebServices.signUp(
      fullName: fullName,
      email: email,
      password: password,
    );
    return UserModel.fromJson(data);
  }
}
