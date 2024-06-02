import 'package:dokan_multivendor/models/user_model.dart';
import 'package:dokan_multivendor/utils/endpoints.dart';
import 'package:http/http.dart' as client;

class ApiServices {

  // Register
  static Future<client.Response> register(UserModel userModel) async {
    return await client.post(
      ApiEndpoints.register,
      body: userModel.toRegister(),
    );
  }
}
