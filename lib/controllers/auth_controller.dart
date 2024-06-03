import 'dart:convert';
import 'package:dokan_multivendor/core/services/api_services.dart';
import 'package:dokan_multivendor/core/services/shared_services.dart';
import 'package:dokan_multivendor/global_widgets/custom_snackbar.dart';
import 'package:dokan_multivendor/helpers/show_response_error.dart';
import 'package:dokan_multivendor/models/user_model.dart';
import 'package:dokan_multivendor/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  // Global Keys
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  // Variables
  RxString selectedImagePath = RxString('');
  var userModel = UserModel().obs;
  RxBool isSecured = RxBool(true);
  RxBool isLoading = RxBool(false);

  // Select Profile Picture
  selectProfilePicture() async {
    final selected = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selected != null) {
      selectedImagePath.value = selected.path;
      userModel.value.profilePicture = selected.path;
      update();
    }
  }

  // Attempt To Register
  Future<void> register() async {
    if (registerKey.currentState!.validate()) {
      if (userModel.value.password != userModel.value.cPassword) {
        snackBar('Password & Confirm Password Mismatch!');
        return;
      }

      // Trigger the loading indicator
      isLoading.value = true;

      // Hit the api as store response as response variable
      final response = await ApiServices.register(userModel.value);

      // After got the response trigger the loading indicator off
      isLoading.value = false;

      // Check if the status code not 200, means request has failed (According to your api)
      if (response.statusCode != 200) {
        // Show the response error message
        showResponseError(response);
        return;
      }

      // If request is success show a success message and navigate the user to login screen
      snackBar('User Registration was Successful');
      Get.offAllNamed(RouteNames.login);

      update();
      return;
    }
  }

  // Attempt to Login
  Future<void> login() async {
    if (loginKey.currentState!.validate()) {
      // Trigger the loading indicator
      isLoading.value = true;

      // Hit the api as store response as response variable
      final response = await ApiServices.login(userModel.value);

      // After got the response trigger the loading indicator off
      isLoading.value = false;

      // Check if the status code not 200, means request has failed (According to your api)
      if (response.statusCode != 200) {
        // Show the response error message
        showResponseError(response);
        return;
      }

      // Store the token to local storage so it can be use in future authenticated request
      storeToken(response);

      // If request is success navigate the user to home screen
      Get.offAllNamed(RouteNames.home);

      // After login get user data and store user id to local storage
      storeID();

      update();
      return;
    }
  }

  // Function to store jwt token to local storage
  Future<void> storeToken(response) async {
    final decode = jsonDecode(response.body);
    SharedServices.setData(SetType.string, 'token', decode['token']);
    SharedServices.setData(SetType.string, 'name', decode['user_display_name']);
    SharedServices.setData(SetType.string, 'email', decode['user_email']);
  }

  // Function to logout user
  Future<void> logout() async {
    // Remove all local storage data
    SharedServices.removeData('token');
    SharedServices.removeData('name');
    SharedServices.removeData('email');

    // Navigate the user to login screen again
    Get.offAllNamed(RouteNames.login);
  }

  // Function to get user data using bearer token
  Future<Map<String, dynamic>> getUserData() async {
    final response = await ApiServices.user();
    return jsonDecode(response.body);
  }

  // Store user ID
  Future<void> storeID () async {
    final response = await getUserData();
    SharedServices.setData(SetType.string, 'user_id', response['id'].toString());
  }

}
