import 'package:dokan_multivendor/utils/config.dart';

class ApiEndpoints {

  static const String apiUrl = '${AppConfig.baseUrl}/wp-json';
  static const String wp = '$apiUrl/wp/v2';
  static const String jwt = '$apiUrl/jwt-auth/v1';

  // Routes
  static Uri register = Uri.parse('$wp/users/register');
  static Uri login = Uri.parse('$jwt/token');
}