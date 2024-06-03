import 'dart:convert';

import 'package:dokan_multivendor/helpers/request_header.dart';
import 'package:dokan_multivendor/models/user_model.dart';
import 'package:dokan_multivendor/utils/endpoints.dart';
import 'package:http/http.dart' as client;

class ApiServices {
  // [POST] Register API
  static Future<client.Response> register(UserModel userModel) async {
    return await client.post(
      ApiEndpoints.register,
      headers: RequestHeader.jsonType(),
      body: jsonEncode(
        userModel.toMap(),
      ),
    );
  }

  // [POST] Login API
  static Future<client.Response> login(UserModel userModel) async {
    return await client.post(
      ApiEndpoints.login,
      headers: RequestHeader.urlEncoded(),
      body: userModel
          .toMap()
          .entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&'),
    );
  }

  // [GET] User Data
  static Future<client.Response> user () async {
    return await client.get(
      ApiEndpoints.userProfile,
      headers: await RequestHeader.auth(),
    );
  }

  // [POST] Update User Profile
  static Future<client.Response> updateProfile (UserModel userModel) async {
    return await client.post(
      Uri.parse('${ApiEndpoints.users}/${userModel.id}'),
      headers: await RequestHeader.auth(),
      body: userModel.toUpdate(),
    );
  }

}
