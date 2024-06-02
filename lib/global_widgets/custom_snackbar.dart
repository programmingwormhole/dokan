import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future snackBar(String message) async {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
