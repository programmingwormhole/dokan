import 'package:dokan_multivendor/core/services/shared_services.dart';

class RequestHeader {
  static Map<String, String> jsonType() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  static Map<String, String> urlEncoded() => {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      };

  static Future<Map<String, String>> auth() async {
    final token = await SharedServices.getData(SetType.string, 'token');
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
