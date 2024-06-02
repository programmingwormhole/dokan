import 'dart:io';

import 'package:dokan_multivendor/core/services/api_services.dart';
import 'package:dokan_multivendor/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {

  // Global Keys
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  RxBool isSecured = RxBool(true);

  // Variables
  RxString selectedImagePath = RxString('');
  var userModel = UserModel().obs;

  // Select Profile Picture
  selectProfilePicture () async {
    final selected = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selected != null) {
      selectedImagePath.value = selected.path;
      userModel.value.profilePicture = selected.path;
      update();
    }
  }

  // Attempt To Register
  Future<void> register () async {
    if (registerKey.currentState!.validate()) {
      final response = await ApiServices.register(userModel.value);

      // TODO:: Need to do login register api
    }
  }


}