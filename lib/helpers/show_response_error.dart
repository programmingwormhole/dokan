import 'dart:convert';
import 'package:dokan_multivendor/global_widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

showResponseError(http.Response response) {
  final decode = jsonDecode(response.body);

  String message = decode['message'] ?? 'something_is_wrong'.tr;

  message = message.replaceAll(RegExp(r'<strong>|</strong>'), "").trim();

  snackBar(message);
  debugPrint(message);
}
